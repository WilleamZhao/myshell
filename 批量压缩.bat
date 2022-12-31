@echo off

echo -------------Start to zip files by 7z------------------

:start

::输入目标目录
echo 请输入需要压缩的目录
set /p target_directory=

::判断非法输入
if "%target_directory%"=="" goto :start
if exist %target_directory% if not exist %target_directory%\nul echo INVALID INPUT: %target_directory% &goto:start

::记录执行文件路径
set current_directary=%cd%
::进入目标路径
cd %target_directory%
::如果是其他区
if "%cd%"=="%current_directary%" cd /d %target_directory%


::设置参数（记得修改为自己的参数）
echo 请输入密码
set /p my_secret=
if "%my_secret%" == "" (
    set my_secret=sourcod.com
)
echo 密码为: %my_secret%
pause
set "exe_dir=C:\Program Files\7-Zip\7z.exe"

set "info_log=%current_directary%\7z_INFO.log" 
set "error_log=%current_directary%\7z_ERROR.log" 


::以下注释可用于调试
::echo %target_directory%
::echo %current_directary%
::pause
::goto start

echo 选择压缩文件类型: 1: 只压缩文件夹 2：只压缩文件 3：全部压缩
set /p select=
::进行压缩
pause
::压缩文件夹
if %select%==1 (
    echo 压缩文件夹
    for /d %%X in (*) do "%exe_dir%" a "%%X.7z" -p%my_secret% -mx=9 -mfb=128 -md=512m -m0=lzma2 "%%X" 1>>%info_log% 2>>%error_log%
) 

::压缩文件
if %select%==2 (
    echo 压缩文件
    for %%X in (*) do "%exe_dir%" a "%%X.7z" -p%my_secret% -mx=9 -mfb=128 -md=512m -m0=lzma2  "%%X" 1>>%info_log% 2>>%error_log%
)

if %select% == 3 (
    echo 全部压缩
    for %%X in (*) do "%exe_dir%" a "%%X.7z" -p%my_secret% -mx=9 -mfb=128 -md=512m -m0=lzma2  "%%X" 1>>%info_log% 2>>%error_log%
    for /d %%X in (*) do "%exe_dir%" a "%%X.7z" -p%my_secret% -mx=9 -mfb=128 -md=512m -m0=lzma2 "%%X" 1>>%info_log% 2>>%error_log%
)

::提示压缩完毕
mshta vbscript:createobject("sapi.spvoice").speak("压缩完成")(window.close)
mshta vbscript:msgbox("压缩完成",1,"My 7z")(window.close)


goto start
