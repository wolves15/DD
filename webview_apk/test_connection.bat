@echo off
chcp 65001 > nul
echo ========================================
echo 网站连接测试
echo ========================================
echo.
echo 目标网站: https://5rb5va315595.vicp.fun/
echo.
echo 正在测试连接...
echo.

ping -n 4 5rb5va315595.vicp.fun

echo.
echo ========================================
echo 测试完成
echo ========================================
echo.
echo 如果看到回复，说明网站可以访问
echo 如果显示请求超时，请检查网络连接
echo.
pause