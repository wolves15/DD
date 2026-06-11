"""
网站连接测试脚本
测试目标网站是否可以正常访问
"""

import urllib.request
import urllib.error
import socket
import sys

def test_website_connection(url, timeout=10):
    """测试网站连接"""
    print(f"正在测试网站连接: {url}")
    print("-" * 50)
    
    try:
        # 创建请求对象
        request = urllib.request.Request(
            url,
            headers={
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
            }
        )
        
        # 尝试连接
        print("正在建立连接...")
        response = urllib.request.urlopen(request, timeout=timeout)
        
        # 获取响应信息
        status_code = response.getcode()
        headers = dict(response.headers)
        
        print(f"✅ 连接成功!")
        print(f"状态码: {status_code}")
        print(f"响应头:")
        for key, value in headers.items():
            print(f"  {key}: {value}")
        
        # 读取部分内容
        content = response.read(1024).decode('utf-8', errors='ignore')
        print(f"\n内容预览 (前500字符):")
        print("-" * 50)
        print(content[:500])
        print("-" * 50)
        
        return True
        
    except urllib.error.HTTPError as e:
        print(f"❌ HTTP错误: {e.code} - {e.reason}")
        return False
        
    except urllib.error.URLError as e:
        if isinstance(e.reason, socket.timeout):
            print(f"❌ 连接超时: {url}")
        else:
            print(f"❌ URL错误: {e.reason}")
        return False
        
    except socket.timeout:
        print(f"❌ 连接超时: {url}")
        return False
        
    except Exception as e:
        print(f"❌ 未知错误: {type(e).__name__} - {e}")
        return False

def test_dns_resolution(hostname):
    """测试DNS解析"""
    print(f"\n正在测试DNS解析: {hostname}")
    print("-" * 50)
    
    try:
        ip_address = socket.gethostbyname(hostname)
        print(f"✅ DNS解析成功!")
        print(f"主机名: {hostname}")
        print(f"IP地址: {ip_address}")
        return True
        
    except socket.gaierror as e:
        print(f"❌ DNS解析失败: {e}")
        return False
        
    except Exception as e:
        print(f"❌ DNS测试错误: {type(e).__name__} - {e}")
        return False

def main():
    """主函数"""
    print("=" * 50)
    print("网站连接测试工具")
    print("=" * 50)
    print()
    
    # 目标网站信息
    url = "https://5rb5va315595.vicp.fun/"
    hostname = "5rb5va315595.vicp.fun"
    
    # 测试DNS解析
    dns_success = test_dns_resolution(hostname)
    
    print()
    
    # 测试网站连接
    connection_success = test_website_connection(url)
    
    print()
    print("=" * 50)
    print("测试结果汇总:")
    print("=" * 50)
    print(f"DNS解析: {'✅ 成功' if dns_success else '❌ 失败'}")
    print(f"网站连接: {'✅ 成功' if connection_success else '❌ 失败'}")
    
    if dns_success and connection_success:
        print("\n🎉 所有测试通过! 网站可以正常访问。")
        return 0
    else:
        print("\n⚠️ 部分测试失败，请检查网络连接或网站状态。")
        return 1

if __name__ == '__main__':
    exit_code = main()
    print(f"\n按Enter键退出...")
    input()
    sys.exit(exit_code)