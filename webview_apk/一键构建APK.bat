@echo off
chcp 65001 > nul
echo ========================================
echo 一键构建APK工具
echo ========================================
echo.
echo 正在检查WSL状态...
wsl -e echo "WSL 正在运行"

if %errorlevel% neq 0 (
    echo WSL未运行，尝试启动...
    wsl --shutdown
    timeout /t 2 > nul
    wsl -d Ubuntu
)

echo.
echo 请在打开的WSL窗口中执行以下命令：
echo.
echo 1. 安装依赖:
echo    sudo apt update && sudo apt install -y git zip unzip openjdk-17-jdk python3-pip autoconf libtool pkg-config zlib1g-dev libncurses5-dev libncursesw5-dev libtinfo5 cmake libffi-dev libssl-dev
echo.
echo 2. 安装Buildozer:
echo    pip3 install buildozer==1.4.0
echo.
echo 3. 进入项目目录:
echo    cd /mnt/c/Users/Administrator/Documents/trae_projects/webview_apk
echo.
echo 4. 构建APK:
echo    buildozer android debug
echo.
echo ========================================
echo 预计构建时间: 20-30分钟
echo ========================================
echo.
pause