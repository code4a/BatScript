# BatScript
简单的软件开发环境变量配置脚本

### **SetPathScript.bat**

* `@echo off` 是关闭回显的，不会显示命令信息 on打开会显示命令信息
* `cls` 清空命令行
* `::` 注释
* `title` 设置cmd窗口的标题
* `:menu` 构建的标号， 使用 `goto menu` 跳转到此标号处，然后执行后边的命令
* `color 0A`设置默认控制台的前景和背景色

        0 = 黑色       8 = 灰色
        1 = 蓝色       9 = 淡蓝色
        2 = 绿色       A = 淡绿色
        3 = 湖蓝色     B = 淡浅绿色
        4 = 红色       C = 淡红色
        5 = 紫色       D = 淡紫色
        6 = 黄色       E = 淡黄色
        7 = 白色       F = 亮白色

* `echo` 输出提示信息
* `echo.` 输出空行
* `set /p "input=请输入命令信息"` 是用来接收控制台输入的文本信息的
* `：menu` 构建的标号， 使用 `goto menu` 跳转到此标号处，然后执行后边的命令
* `if else` 是用来做判断 `if defined input` 是用来判断用户是否输入信息，回车的话，则表示未定义input的值
* `set javaPath=%input%` 是用来吧变量input的值赋值给javaPath变量的
* `wmic` 是提供了批处理的命令，可以方便的操作环境变量值
* `if else` 语句

    1.增强用法：IF [/I] string1 compare-op string2 command
    
    2.增强用法中加上/I就不区分大小写了!
    
    3.增强用法中还有一些用来判断数字的符号：
    
        EQU - 等于
        NEQ - 不等于
        LSS - 小于
        LEQ - 小于或等于
        GTR - 大于
        GEQ - 大于或等于
      
    4.上面的command命令都可以用小括号来使用多条命令的组合，包括else子句，组合命令中可以嵌套使用条件或循环命令。

* 删除某一环境变量 就使用命令

        `wmic ENVIRONMENT where "name='JAVA_HOME'" delete`
        
* 创建某一环境变量 使用命令

        `wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%javaPath%"`
        
* 修改某一环境变量 使用命令

        `wmic ENVIRONMENT where "name='Path' and username='<system>'" set VariableValue="value"`

**注意事项：**

1、在上述批处理脚本命令中，要严格注意空格和大小写等的输入，不然执行不成功的

2、要以管理员方式运行命令，不然提示拒绝执行命令的提示
