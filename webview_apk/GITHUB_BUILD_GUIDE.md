# 使用 GitHub Actions 自动构建 APK

## 🚀 快速开始指南

### 第一步：创建 GitHub 账号
1. 访问 https://github.com
2. 点击 "Sign up" 注册账号（如果已有账号请跳过）

### 第二步：创建新仓库
1. 登录 GitHub
2. 点击右上角的 "+" 号，选择 "New repository"
3. 填写仓库信息：
   - Repository name: `webview-apk`
   - Description: `WebView Android App`
   - 选择 "Public"（公开）
   - ✅ 勾选 "Add a README file"
4. 点击 "Create repository"

### 第三步：上传项目文件

#### 方法A：使用网页上传（推荐新手）
1. 在仓库页面点击 "Add file" → "Upload files"
2. 将以下文件拖拽上传：
   ```
   webview_apk/
   ├── main.py
   ├── buildozer.spec
   ├── requirements.txt
   ├── .github/workflows/build-apk.yml
   └── .gitignore
   ```
3. 在 "Commit changes" 输入提交信息
4. 点击 "Commit changes"

#### 方法B：使用 Git 命令行
```bash
# 进入项目目录
cd c:\Users\Administrator\Documents\trae_projects\webview_apk

# 初始化 Git 仓库
git init

# 添加远程仓库（替换 YOUR_USERNAME 为你的 GitHub 用户名）
git remote add origin https://github.com/YOUR_USERNAME/webview-apk.git

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: WebView APK project"

# 推送到 GitHub
git branch -M main
git push -u origin main
```

### 第四步：自动构建 APK
1. 上传完成后，GitHub Actions 会自动开始构建
2. 点击仓库页面的 "Actions" 标签
3. 查看构建进度（约 20-30 分钟）

### 第五步：下载 APK
1. 构建完成后，在 Actions 页面点击对应的工作流
2. 在页面底部的 "Artifacts" 区域找到 `webview-app-apk`
3. 点击下载 ZIP 文件
4. 解压后即可获得 APK 文件

## 📱 安装 APK 到手机
1. 将 APK 文件传输到 Android 手机
2. 在手机上打开文件管理器
3. 点击 APK 文件
4. 允许安装未知来源应用
5. 完成安装

## ⚙️ 手动触发构建
如果需要重新构建：
1. 进入 "Actions" 标签
2. 选择 "Build Android APK" 工作流
3. 点击 "Run workflow" → "Run workflow"

## 🔧 修改网站地址
如需更改目标网站：
1. 编辑 `main.py` 文件
2. 修改第 48 行的 URL
3. 提交更改，GitHub Actions 会自动重新构建

## 📞 需要帮助？
如果遇到问题，请检查：
- GitHub Actions 日志中的错误信息
- 确保所有文件都已正确上传
- 检查 buildozer.spec 配置是否正确