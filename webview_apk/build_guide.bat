@echo off
chcp 65001 > nul
echo ========================================
echo WebView APK 构建指南
echo ========================================
echo.
echo 当前环境: Windows
echo 目标网站: https://5rb5va315595.vicp.fun/
echo.
echo ========================================
echo 构建APK需要以下步骤:
echo ========================================
echo.
echo 1. 安装 WSL (Windows Subsystem for Linux)
echo    - 已安装，需要重启系统
echo.
echo 2. 打开 Ubuntu 终端
echo    命令: wsl -d Ubuntu
echo.
echo 3. 进入项目目录
echo    命令: cd /mnt/c/Users/Administrator/Documents/trae_projects/webview_apk
echo.
echo 4. 安装依赖
echo    命令: sudo apt update && sudo apt install -y git zip unzip openjdk-17-jdk python3-pip autoconf libtool pkg-config zlib1g-dev libncurses5-dev libncursesw5-dev libtinfo5 cmake libffi-dev libssl-dev
echo.
echo 5. 安装 Buildozer
echo    命令: pip3 install buildozer
echo.
echo 6. 开始构建
echo    命令: buildozer android debug
echo.
echo ========================================
echo 预计时间: 首次构建约1-2小时
echo ========================================
echo.
echo APK输出位置: bin/webviewapp-1.0.0-debug.apk
echo.
pause