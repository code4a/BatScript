@echo off
cls
:: TODO:����java��������
:: Author: code4a
title �����������ýű�

:menu
:: cls
color 0A

echo.
echo	--------------------------------------------------------
echo		��������ţ�ѡ��װ��Ӧ�Ļ���������Ȼ�󰴻س�
echo	--------------------------------------------------------
echo.
echo 	***********************************
echo 	***    1.����java��������       ***
echo 	***    2.����android��������    ***
echo 	***    3.����python��������     ***
echo 	***    4.�������ϻ�������       ***
echo 	***    5.�˳�                   ***
echo 	***********************************
echo.
echo.

:cho
set index = 

set /p "index=��������ѡ������:"
IF NOT "%index%"=="" SET index=%index:~0,1%

if /i "%index%" == "1" goto setJavaHome
if /i "%index%" == "2" goto setAndroidHome
if /i "%index%" == "3" goto setPythonHome
if /i "%index%" == "4" goto setAllHome
if /i "%index%" == "5" goto bye
echo ѡ����Ч������������
echo.
goto cho

:setAllHome
:setJavaHome
echo java�����������ÿ�ʼ

::����java�İ�װ·�����ɷ����л���ͬ�İ汾
set javaInput=
set /p "javaInput=������java��jdk·������س�Ĭ��·��ΪE:\program\Java\jdk1.7.0_79��:"
if defined javaInput (echo jdk������) else (set javaInput=E:\program\Java\jdk1.7.0_79)
echo jdk·��Ϊ%javaInput%
set javaPath=%javaInput%

::����еĻ�����ɾ��JAVA_HOME
wmic ENVIRONMENT where "name='JAVA_HOME'" delete

::����еĻ�����ɾ��ClASS_PATH 
wmic ENVIRONMENT where "name='CLASS_PATH'" delete

::����JAVA_HOME
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%javaPath%"

::����CLASS_PATH
wmic ENVIRONMENT create name="CLASS_PATH",username="<system>",VariableValue=".;%%JAVA_HOME%%\lib\tools.jar;%%JAVA_HOME%%\lib\dt.jar;"

::�ڻ�������path�У��޳�������java_home�е��ַ�������ʣ�µ��ַ���
call set javaTemp=%Path%;%JAVA_HOME%\jre\bin;%JAVA_HOME%\bin

::echo %javaTemp%

::�������Ե��ַ����¸�ֵ��path��
wmic ENVIRONMENT where "name='Path' and username='<system>'" set VariableValue="%javaTemp%"

echo java�����������óɹ���

if %index% EQU 1 ( goto menu )

:setAndroidHome

echo ����Android����������ʼ

:: TODO:����Android��������
::����android sdk�İ�װ·�����ɷ����л���ͬ�İ汾
set androidInput=
set /p "androidInput=������Android��sdk·������س�Ĭ��·��ΪE:\program\android-sdk-windows��:"
if defined androidInput (echo jdk������) else (set androidInput=E:\program\android-sdk-windows)
echo sdk·��Ϊ%androidInput%
set sdkPath=%androidInput%

::����еĻ�����ɾ��ANDROID_SDK_HOME
wmic ENVIRONMENT where "name='ANDROID_SDK_HOME'" delete

::����ANDROID_SDK_HOME
wmic ENVIRONMENT create name="ANDROID_SDK_HOME",username="<system>",VariableValue="%sdkPath%"

::�ڻ�������path�У��޳�������ANDROID_SDK_HOME�е��ַ�������ʣ�µ��ַ���
call set androidSdkTemp=%Path%;%ANDROID_SDK_HOME%\platform-tools;%ANDROID_SDK_HOME%\tools

::echo %androidSdkTemp%

::�������Ե��ַ����¸�ֵ��path��
wmic ENVIRONMENT where "name='Path' and username='<system>'" set VariableValue="%androidSdkTemp%"

echo android sdk�����������óɹ���

if %index% EQU 2 ( goto menu )

:setPythonHome

echo ����Python����������ʼ

:: TODO:����Python��������
::����python�İ�װ·�����ɷ����л���ͬ�İ汾
set pythonInput=
set /p "pythonInput=������Python��sdk·������س�Ĭ��·��ΪE:\program\tools\Python\Python27��:"
if defined pythonInput (echo jdk������) else (set pythonInput=E:\program\tools\Python\Python27)
echo python·��Ϊ%pythonInput%
set pythonPath=%pythonInput%

::����еĻ�����ɾ��ANDROID_SDK_HOME
wmic ENVIRONMENT where "name='PYTHON_HOME'" delete

::����ANDROID_SDK_HOME
wmic ENVIRONMENT create name="PYTHON_HOME",username="<system>",VariableValue="%pythonPath%"

::�ڻ�������path�У��޳�������PYTHON_HOME�е��ַ�������ʣ�µ��ַ���
call set pythonTemp=%Path%;%PYTHON_HOME%;%PYTHON_HOME%\Scripts

::echo %pythonTemp%

::�������Ե��ַ����¸�ֵ��path��
wmic ENVIRONMENT where "name='Path' and username='<system>'" set VariableValue="%pythonTemp%"

echo Python�����������óɹ���

if %index% EQU 3 ( goto menu )

echo ����������ȫ��������ɣ�

:bye
echo Thanks open source!
echo Thanks for using! 
pause

