#!/bin/bash
# WebView APK 打包脚本
# 适用于 Ubuntu/Debian 环境

echo "========================================"
echo "WebView APK 打包脚本"
echo "========================================"
echo ""

# 检查是否为root用户
if [ "$(id -u)" != "0" ]; then
    echo "请使用 root 用户运行此脚本 (sudo ./build_apk.sh)"
    exit 1
fi

echo "步骤 1: 更新系统..."
apt update -y

echo ""
echo "步骤 2: 安装必要依赖..."
apt install -y git zip unzip openjdk-17-jdk python3-pip autoconf libtool pkg-config zlib1g-dev libncurses5-dev libncursesw5-dev libtinfo5 cmake libffi-dev libssl-dev

echo ""
echo "步骤 3: 安装 Buildozer..."
pip3 install buildozer

echo ""
echo "步骤 4: 设置工作目录..."
cd /mnt/c/Users/Administrator/Documents/trae_projects/webview_apk

echo ""
echo "步骤 5: 开始构建 APK..."
buildozer android debug

echo ""
echo "========================================"
echo "构建完成！"
echo "========================================"
echo ""
echo "APK 文件位置: bin/webviewapp-0.1-debug.apk"
echo ""
echo "将 APK 文件复制到 Windows: cp bin/*.apk /mnt/c/Users/Administrator/Documents/"
echo ""