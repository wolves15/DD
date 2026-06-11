#!/usr/bin/env python3
"""
简化版测试应用 - 不依赖Kivy框架
直接使用webbrowser打开指定网站
"""

import webbrowser
import sys
import os

def open_website():
    """打开目标网站"""
    url = 'https://5rb5va315595.vicp.fun/'
    print(f"正在打开网站: {url}")
    
    try:
        webbrowser.open(url)
        print("网站已在默认浏览器中打开")
        return True
    except Exception as e:
        print(f"打开网站时出错: {e}")
        return False

def main():
    """主函数"""
    print("=" * 50)
    print("WebView APK 测试应用")
    print("=" * 50)
    print()
    
    # 检测操作系统
    if sys.platform == 'android':
        print("运行环境: Android")
    elif sys.platform == 'win32':
        print("运行环境: Windows")
    elif sys.platform == 'darwin':
        print("运行环境: macOS")
    elif sys.platform.startswith('linux'):
        print("运行环境: Linux")
    else:
        print(f"运行环境: {sys.platform}")
    
    print()
    
    # 打开网站
    success = open_website()
    
    print()
    if success:
        print("操作完成！")
    else:
        print("操作失败，请检查网络连接")
    
    print()
    print("按Enter键退出...")
    input()

if __name__ == '__main__':
    main()