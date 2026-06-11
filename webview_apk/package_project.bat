@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

echo ========================================
echo WebView APK 项目打包工具
echo ========================================
echo.

REM 设置项目目录
set "PROJECT_DIR=c:\Users\Administrator\Documents\trae_projects\webview_apk"
set "OUTPUT_DIR=c:\Users\Administrator\Documents\trae_projects"
set "ZIP_NAME=webview-apk-project.zip"

echo 正在打包项目文件...
echo.

REM 创建临时目录
set "TEMP_DIR=%OUTPUT_DIR%\webview-apk-temp"
if exist "%TEMP_DIR%" rmdir /s /q "%TEMP_DIR%"
mkdir "%TEMP_DIR%"

REM 复制必要文件
echo 复制文件中...
copy "%PROJECT_DIR%\main.py" "%TEMP_DIR%\" > nul
copy "%PROJECT_DIR%\buildozer.spec" "%TEMP_DIR%\" > nul
copy "%PROJECT_DIR%\requirements.txt" "%TEMP_DIR%\" > nul
copy "%PROJECT_DIR%\.gitignore" "%TEMP_DIR%\" > nul
copy "%PROJECT_DIR%\README.md" "%TEMP_DIR%\" > nul

REM 创建 .github/workflows 目录
mkdir "%TEMP_DIR%\.github\workflows" > nul
copy "%PROJECT_DIR%\.github\workflows\build-apk.yml" "%TEMP_DIR%\.github\workflows\" > nul

REM 使用 PowerShell 创建 ZIP 文件
echo 创建 ZIP 文件...
powershell -Command "Compress-Archive -Path '%TEMP_DIR%\*' -DestinationPath '%OUTPUT_DIR%\%ZIP_NAME%' -Force"

REM 清理临时目录
rmdir /s /q "%TEMP_DIR%"

echo.
echo ========================================
echo 打包完成！
echo ========================================
echo.
echo ZIP 文件位置: %OUTPUT_DIR%\%ZIP_NAME%
echo.
echo 下一步操作:
echo 1. 访问 https://github.com
echo 2. 创建新仓库（点击 New repository）
echo 3. 上传 ZIP 文件中的内容
echo 4. GitHub Actions 将自动构建 APK
echo.
echo 详细说明请查看: GITHUB_BUILD_GUIDE.md
echo.
pause