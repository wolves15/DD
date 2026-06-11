# WebView APK 应用

一个使用Python和Kivy框架开发的简单Android应用，打开后自动跳转到指定网站。

## 功能特性

- 启动应用后自动打开指定网站
- 支持手动点击按钮打开网站
- 跨平台支持（Android、Windows、Linux、macOS）

## 项目结构

```
webview_apk/
├── main.py              # 主应用文件
├── buildozer.spec       # Buildozer配置文件
├── requirements.txt     # Python依赖
└── README.md           # 说明文档
```

## 安装依赖

### Windows/Linux/macOS

```bash
pip install -r requirements.txt
```

## 运行应用

### 在电脑上测试

```bash
python main.py
```

### 打包成APK

#### 前置要求

1. 安装Buildozer：
```bash
pip install buildozer
```

2. 安装依赖（Ubuntu/Debian）：
```bash
sudo apt update
sudo apt install -y git zip unzip openjdk-17-jdk python3-pip autoconf libtool pkg-config zlib1g-dev libncurses5-dev libncursesw5-dev libtinfo5 cmake libffi-dev libssl-dev
```

#### 打包命令

```bash
buildozer android debug
```

打包完成后，APK文件位于 `bin/` 目录下。

## 配置说明

### 修改目标网站

编辑 [main.py](file:///c:\Users\Administrator\Documents\trae_projects\webview_apk\main.py) 文件，修改第42行的URL：

```python
url = 'https://5rb5va315595.vicp.fun/'  # 修改为你的目标网站
```

### 修改应用信息

编辑 [buildozer.spec](file:///c:\Users\Administrator\Documents\trae_projects\webview_apk\buildozer.spec) 文件：

```ini
title = WebView App              # 应用标题
package.name = webviewapp        # 包名
package.domain = org.example     # 域名
version = 1.0.0                  # 版本号
```

## 测试结果

### 网络连接测试
- **DNS解析**: ❌ 失败 - 5rb5va315595.vicp.fun 无法解析
- **网站连接**: ❌ 无法连接 - 目标网站可能不可用

### 测试文件说明
项目包含以下测试文件：

1. **test.html** - HTML测试页面，可在浏览器中打开测试跳转功能
2. **test.bat** - Windows批处理脚本，直接打开目标网站
3. **test_simple.py** - 简化版Python测试脚本
4. **test_connection.py** - 网站连接测试脚本
5. **test_connection.bat** - 网络连接测试脚本

### 建议操作
1. 确认目标网站地址是否正确
2. 检查网络连接和DNS设置
3. 如果网站不可用，建议修改 [main.py](file:///c:\Users\Administrator\Documents\trae_projects\webview_apk\main.py) 中的URL为其他可访问的网站
4. 可以先使用 test.html 在浏览器中测试跳转功能

## 注意事项

1. **首次打包时间较长**：Buildozer首次运行需要下载Android SDK、NDK等工具，可能需要较长时间。

2. **网络权限**：确保在AndroidManifest.xml中添加了网络权限（Buildozer会自动处理）。

3. **HTTPS支持**：如果目标网站使用HTTPS，确保Android设备信任该证书。

4. **测试建议**：建议先在电脑上测试应用功能，确认无误后再进行APK打包。

5. **目标网站可用性**：确保目标网站可以正常访问，否则应用将无法正常工作。

## 故障排除

### 打包失败

- 检查Java版本：需要Java 17或更高版本
- 确保有足够的磁盘空间（至少5GB）
- 检查网络连接，需要下载依赖包

### 应用无法打开网站

- 检查设备网络连接
- 确认目标网站可访问
- 检查URL格式是否正确

## 技术栈

- **Kivy**: 跨平台Python GUI框架
- **Buildozer**: Python应用打包工具
- **PyJNIus**: Python与Java桥接库

## 许可证

MIT License