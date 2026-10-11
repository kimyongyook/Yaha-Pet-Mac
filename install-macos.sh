#!/bin/bash
set -euo pipefail
command -v uv >/dev/null || { echo 'Install uv first: https://docs.astral.sh/uv/getting-started/installation/'; exit 1; }
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALL_DIR="$HOME/Library/Application Support/Yaha-Pet"
uv venv --python 3.12 --allow-existing "$INSTALL_DIR/venv"
uv pip install --python "$INSTALL_DIR/venv/bin/python" -r "$SOURCE_DIR/requirements-macos.txt"
"$INSTALL_DIR/venv/bin/python" - "$SOURCE_DIR" <<'PY'
from pathlib import Path
import plistlib
import shutil
import sys
source = Path(sys.argv[1]).resolve()
base = Path.home() / 'Library/Application Support/Yaha-Pet'
destination = base / 'source'
if source != destination.resolve():
    shutil.copytree(source, destination, dirs_exist_ok=True,
                    ignore=shutil.ignore_patterns('.git', '.venv', 'venv', '__pycache__', '*.before-*', '.DS_Store'))
bundle = Path.home() / 'Applications/Yaha-Pet.app'
(bundle / 'Contents/MacOS').mkdir(parents=True, exist_ok=True)
(bundle / 'Contents/Resources').mkdir(exist_ok=True)
info = dict(CFBundleName='Yaha-Pet', CFBundleDisplayName='Yaha-Pet',
            CFBundleIdentifier='local.yaha-pet.desktop', CFBundleVersion='1',
            CFBundleExecutable='Yaha-Pet', CFBundlePackageType='APPL',
            CFBundleIconFile='AppIcon', LSUIElement=True, NSHighResolutionCapable=True)
with (bundle / 'Contents/Info.plist').open('wb') as file:
    plistlib.dump(info, file)
launcher = bundle / 'Contents/MacOS/Yaha-Pet'
launcher.write_text('''#!/bin/zsh
cd "$HOME/Library/Application Support/Yaha-Pet/source" || exit 1
mkdir -p "$HOME/Library/Logs/Yaha-Pet"
exec "$HOME/Library/Application Support/Yaha-Pet/venv/bin/python" -u 'Yaha-Pet-Mac.py' >> "$HOME/Library/Logs/Yaha-Pet/app.log" 2>&1
''')
launcher.chmod(0o755)
PY
ICON_DIR="$(mktemp -d)/AppIcon.iconset"
mkdir -p "$ICON_DIR"
sips -z 128 128 "$SOURCE_DIR/assets/chiikawa/icons/icon.png" --out "$ICON_DIR/icon_128x128.png" >/dev/null
sips -z 256 256 "$SOURCE_DIR/assets/chiikawa/icons/icon.png" --out "$ICON_DIR/icon_128x128@2x.png" >/dev/null
iconutil -c icns "$ICON_DIR" -o "$HOME/Applications/Yaha-Pet.app/Contents/Resources/AppIcon.icns"
echo "Installed: $HOME/Applications/Yaha-Pet.app"
echo 'Quit any running Yaha-Pet instance before reopening to apply updates.'
