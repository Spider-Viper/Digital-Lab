### 7段共阴极数码管动态显示电路

* 数码管循环显示0~f16个数字，时间间隔为1s

* 系统框图
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/sequential_circuit/seven_segments/picture/%E6%95%B0%E7%A0%81%E7%AE%A1%E5%8A%A8%E6%80%81%E6%98%BE%E7%A4%BA%E7%94%B5%E8%B7%AF%E6%A1%86%E5%9B%BE.png)

* 输入时钟为50MHz，经过分频模块产生1Hz时钟；计数器在1Hz时钟驱动下计数，计数范围为0~15；译码器对计数器输出值进行译码，译码结果驱动7段共阴极数码管；实现数码管动态显示。

* 板上验证结果
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/sequential_circuit/seven_segments/picture/%E4%B8%8A%E6%9D%BF%E9%AA%8C%E8%AF%81.jpg)
