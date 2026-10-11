# Yaha-Pet for macOS

[gitChara-dot/Yaha-Pet](https://github.com/gitChara-dot/Yaha-Pet)의 macOS용 수정판입니다. 원본 코드와 캐릭터 에셋, 라이선스 및 Git 이력을 유지합니다.

## macOS 설치

Apple Silicon Mac에서 Python 3.12로 실행 확인했습니다. `uv`가 필요합니다.

```sh
git clone https://github.com/kimyongyook/Yaha-Pet-Mac.git
cd Yaha-Pet-Mac
./install-macos.sh
open ~/Applications/Yaha-Pet.app
```

- 실행 시 치이카와가 자동으로 나타납니다.
- 캐릭터를 드래그해서 이동할 수 있습니다.
- 메뉴 막대 아이콘의 **Spawn Character**에서 캐릭터를 추가하고 **Exit**로 종료합니다.
- 일반 창 위에 표시하고, 앱이 비활성화되어도 숨기지 않습니다.
- 모든 데스크탑 및 다른 앱의 전체 화면 공간에 참여하도록 macOS 창 속성을 설정합니다. 창 속성이 Qt에 의해 변경되면 다시 적용합니다.
- 설치 위치: `~/Applications/Yaha-Pet.app`, 실행 환경과 에셋: `~/Library/Application Support/Yaha-Pet`.
- 실행 로그: `~/Library/Logs/Yaha-Pet/app.log`.

Mac 수정본은 `Yaha-Pet-Mac.py`이며, `Yaha-Pet!.py`는 원본입니다. macOS 전체 화면·Stage Manager의 구체적인 표시 동작은 OS와 앱에 따라 달라질 수 있습니다. 자동 로그인 실행은 설정하지 않습니다.

## 출처와 라이선스

원본: [gitChara-dot/Yaha-Pet](https://github.com/gitChara-dot/Yaha-Pet), MIT ([LICENSE.md](LICENSE.md)). 치이카와 캐릭터 및 관련 에셋의 권리는 원작자 Nagano에게 있습니다. 비영리 팬 프로젝트입니다.

---

## Original README

# Yaha-Pet!

A simple desktop pet application featuring characters from the "Chiikawa" universe, created with Python and PyQt6. The characters will roam your desktop, play animations, and react to your interactions.

## ✨ Features

* Autonomous Behavior: Characters walk around the screen on their own.
* Interactive: Drag and drop the characters anywhere on your screen.
* Lively Animations: Features several sprite animations for different actions like walking and dancing.
* Sound Effects: Characters have unique sounds for animations and interactions.
* System Tray Control: Manage your spawned characters through a system tray icon menu.
* Customizable: Don't like a certain animation? Sound is too loud? Change it all on the tray control.

## 🚀 How to Run

This application is intended for Windows users.

1.  Go to the Releases (https://github.com/gitChara-dot/Yaha-Pet/releases) page of this repository.
2.  Download the latest `.zip` file (e.g., `Yaha-Pet-v1.0.zip`).
3.  Unzip the downloaded file.
4.  Run the `.exe` file inside the folder.
5.  Open Window System Tray (The small arrow pointing up on your taskbar), right-click Usagi's Icon. That's it!

6.  (OPTIONAL, IMPORTANT FOR WIN11 USERS): If you have Windows 11 and don't have the System Tray on your taskbar, do these steps:
    a. Right click the Taskbar
    b. Open taskbar configuration
    c. Go to "Taskbar Overflow" or "Other Taskbar Icons"
    d. Enable Yaha-Pet.

## ⚠️ Disclaimer

This is a non-profit fan project created for entertainment and educational purposes. All characters and associated assets from "Chiikawa" are the intellectual property of their original creator, Nagano. Please support the official work.

## 📄 License

This project is licensed under the MIT License. See the `LICENSE.md` file for details.

