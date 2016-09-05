@echo off
cls
:: TODO:设置java环境变量
:: Author: code4a
title 环境变量配置脚本

:menu
:: cls
color 0A

echo.
echo	--------------------------------------------------------
echo		请输入序号，选择安装对应的环境变量，然后按回车
echo	--------------------------------------------------------
echo.
echo 	***********************************
echo 	***    1.设置java环境变量       ***
echo 	***    2.设置android环境变量    ***
echo 	***    3.设置python环境变量     ***
echo 	***    4.设置以上环境变量       ***
echo 	***    5.退出                   ***
echo 	***********************************
echo.
echo.

:cho
set index = 

set /p "index=请输入您选择的序号:"
IF NOT "%index%"=="" SET index=%index:~0,1%

if /i "%index%" == "1" goto setJavaHome
if /i "%index%" == "2" goto setAndroidHome
if /i "%index%" == "3" goto setPythonHome
if /i "%index%" == "4" goto setAllHome
if /i "%index%" == "5" goto bye
echo 选择无效，请重新输入
echo.
goto cho

:setAllHome
:setJavaHome
echo java环境变量设置开始

::设置java的安装路径，可方便切换不同的版本
set javaInput=
set /p "javaInput=请输入java的jdk路径（或回车默认路径为E:\program\Java\jdk1.7.0_79）:"
if defined javaInput (echo jdk已设置) else (set javaInput=E:\program\Java\jdk1.7.0_79)
echo jdk路径为%javaInput%
set javaPath=%javaInput%

::如果有的话，先删除JAVA_HOME
wmic ENVIRONMENT where "name='JAVA_HOME'" delete

::如果有的话，先删除ClASS_PATH 
wmic ENVIRONMENT where "name='CLASS_PATH'" delete

::创建JAVA_HOME
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%javaPath%"

::创建CLASS_PATH
wmic ENVIRONMENT create name="CLASS_PATH",username="<system>",VariableValue=".;%%JAVA_HOME%%\lib\tools.jar;%%JAVA_HOME%%\lib\dt.jar;"

::在环境变量path中，剔除掉变量java_home中的字符，回显剩下的字符串
call set javaTemp=%Path%;%JAVA_HOME%\jre\bin;%JAVA_HOME%\bin

::echo %javaTemp%

::将返回显的字符重新赋值到path中
wmic ENVIRONMENT where "name='Path' and username='<system>'" set VariableValue="%javaTemp%"

echo java环境变量设置成功！

if %index% EQU 1 ( goto menu )

:setAndroidHome

echo 设置Android环境变量开始

:: TODO:设置Android环境变量
::设置android sdk的安装路径，可方便切换不同的版本
set androidInput=
set /p "androidInput=请输入Android的sdk路径（或回车默认路径为E:\program\android-sdk-windows）:"
if defined androidInput (echo jdk已设置) else (set androidInput=E:\program\android-sdk-windows)
echo sdk路径为%androidInput%
set sdkPath=%androidInput%

::如果有的话，先删除ANDROID_SDK_HOME
wmic ENVIRONMENT where "name='ANDROID_SDK_HOME'" delete

::创建ANDROID_SDK_HOME
wmic ENVIRONMENT create name="ANDROID_SDK_HOME",username="<system>",VariableValue="%sdkPath%"

::在环境变量path中，剔除掉变量ANDROID_SDK_HOME中的字符，回显剩下的字符串
call set androidSdkTemp=%Path%;%ANDROID_SDK_HOME%\platform-tools;%ANDROID_SDK_HOME%\tools

::echo %androidSdkTemp%

::将返回显的字符重新赋值到path中
wmic ENVIRONMENT where "name='Path' and username='<system>'" set VariableValue="%androidSdkTemp%"

echo android sdk环境变量设置成功！

if %index% EQU 2 ( goto menu )

:setPythonHome

echo 设置Python环境变量开始

:: TODO:设置Python环境变量
::设置python的安装路径，可方便切换不同的版本
set pythonInput=
set /p "pythonInput=请输入Python的sdk路径（或回车默认路径为E:\program\tools\Python\Python27）:"
if defined pythonInput (echo jdk已设置) else (set pythonInput=E:\program\tools\Python\Python27)
echo python路径为%pythonInput%
set pythonPath=%pythonInput%

::如果有的话，先删除ANDROID_SDK_HOME
wmic ENVIRONMENT where "name='PYTHON_HOME'" delete

::创建ANDROID_SDK_HOME
wmic ENVIRONMENT create name="PYTHON_HOME",username="<system>",VariableValue="%pythonPath%"

::在环境变量path中，剔除掉变量PYTHON_HOME中的字符，回显剩下的字符串
call set pythonTemp=%Path%;%PYTHON_HOME%;%PYTHON_HOME%\Scripts

::echo %pythonTemp%

::将返回显的字符重新赋值到path中
wmic ENVIRONMENT where "name='Path' and username='<system>'" set VariableValue="%pythonTemp%"

echo Python环境变量设置成功！

if %index% EQU 3 ( goto menu )

echo 环境变量已全部设置完成！

:bye
echo Thanks open source!
echo Thanks for using! 
pause

