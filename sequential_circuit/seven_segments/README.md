### 7段共阴极数码管动态显示电路

* 数码管循环显示 0~f 16个数字，时间间隔为1s

* 系统框图
![]()

* 输入时钟为50MHz，经过分频电路产生1Hz时钟；计数器在1Hz时钟驱动下计数，计数范围为0~15；译码器对计数器输出值进行译码，译码结果驱动7段共阴极数码管，实现数码管动态显示。

* 板上验证结果
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/sequential_circuit/seven_segments/picture/%E4%B8%8A%E6%9D%BF%E9%AA%8C%E8%AF%81.jpg)
