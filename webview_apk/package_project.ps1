# WebView APK 项目打包脚本
# 使用 PowerShell 运行

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "WebView APK 项目打包工具" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 设置路径
$projectDir = "c:\Users\Administrator\Documents\trae_projects\webview_apk"
$outputDir = "c:\Users\Administrator\Documents\trae_projects"
$zipName = "webview-apk-project.zip"

Write-Host "正在打包项目文件..." -ForegroundColor Yellow
Write-Host ""

# 创建临时目录
$tempDir = Join-Path $outputDir "webview-apk-temp"
if (Test-Path $tempDir) {
    Remove-Item -Path $tempDir -Recurse -Force
}
New-Item -ItemType Directory -Path $tempDir | Out-Null

# 复制文件
Write-Host "复制文件中..." -ForegroundColor Yellow
Copy-Item -Path "$projectDir\main.py" -Destination $tempDir
Copy-Item -Path "$projectDir\buildozer.spec" -Destination $tempDir
Copy-Item -Path "$projectDir\requirements.txt" -Destination $tempDir
Copy-Item -Path "$projectDir\.gitignore" -Destination $tempDir
Copy-Item -Path "$projectDir\README.md" -Destination $tempDir

# 创建目录结构
$workflowsDir = Join-Path $tempDir ".github\workflows"
New-Item -ItemType Directory -Path $workflowsDir -Force | Out-Null
Copy-Item -Path "$projectDir\.github\workflows\build-apk.yml" -Destination $workflowsDir

# 创建 ZIP 文件
Write-Host "创建 ZIP 文件..." -ForegroundColor Yellow
$zipPath = Join-Path $outputDir $zipName
if (Test-Path $zipPath) {
    Remove-Item -Path $zipPath -Force
}
Compress-Archive -Path "$tempDir\*" -DestinationPath $zipPath

# 清理临时目录
Remove-Item -Path $tempDir -Recurse -Force

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "打包完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "ZIP 文件位置: $zipPath" -ForegroundColor Cyan
Write-Host ""
Write-Host "下一步操作:" -ForegroundColor Yellow
Write-Host "1. 访问 https://github.com" -ForegroundColor White
Write-Host "2. 创建新仓库（点击 New repository）" -ForegroundColor White
Write-Host "3. 上传 ZIP 文件中的内容" -ForegroundColor White
Write-Host "4. GitHub Actions 将自动构建 APK" -ForegroundColor White
Write-Host ""
Write-Host "详细说明请查看: GITHUB_BUILD_GUIDE.md" -ForegroundColor Cyan
Write-Host ""