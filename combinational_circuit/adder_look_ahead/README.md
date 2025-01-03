# N位超前进位加法器

* 实现N位超前进位加法器，默认为4位加法器

* generate关键字
* $random系统函数
    * 有符号 32位 -2^31 ~ 2^31 - 1
    * 生成0 ~ N-1 范围内的随机数：$random % N
    * 生成max ~ min范围内的随机数：min + $random % (max - min + 1)
    * 种子（seed）

* 仿真结果：

![]()

* RTL Schematic:

![]()

* Synthesis Schematic:

![]()




