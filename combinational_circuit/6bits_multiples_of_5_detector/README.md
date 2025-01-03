### 6比特 5的倍数检测器

* 判断6比特输入数据是否为5的倍数

* 
    1. 利用除法实现
    2. 利用状态机实现 ？？？

* 模块框图：

![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/6bits_multiples_of_5_detector/picture/detector.png)

* 端口说明：
    * 输出端口：
        * din[5:0]: 6位数据输入端口
        * en: 检测使能端口
        * rstn: 复位端口，低电平有效
    * 输入端口：
        * dout: 检测结果输出端口，高电平表示输入数据是5的倍数，低电平表示输入数据非5的倍数
        * out_en: 检测输出使能信号，高电平表示检测输出信号有效，低电平表示检测输出信号无效
        
* 仿真结果：

![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/6bits_multiples_of_5_detector/picture/testbench.png)

* RTL Schematic:

![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/6bits_multiples_of_5_detector/picture/RTLSchematic.png)

* Syntehsis Schematic:

![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/6bits_multiples_of_5_detector/picture/SyntesisSchematic.png)
