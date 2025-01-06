### 格雷码与二进制码相互转换

* 实现n位格雷码和n位二进制码相互转换,默认为8位

![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/GrayCode_BinaryCode/picture/%E6%A1%86%E5%9B%BE.png)

* 端口说明：
    * 输出端口：
        * code_out[7:0]: 转换后编码输出
        * gray_out_en: 格雷码输出有效端口。当实现二进制码转换为格雷码时，输出高电平，否则输出低电平。
        * binary_out_en: 二进制码输出有效端口。 当实现格雷码转换为二进制码时， 输出高电平，否则输出为低电平。
    * 输入端口：
        * code_in[7:0]: 待转换编码输入
        * mode_sel: 模式选择端口。高电平为格雷码转换为二进制码，低电平为二进制码转换为格雷码。
        * en: 转换使能端口
        * rstn: 复位，低电平有效

* RTL Schematic:
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/GrayCode_BinaryCode/picture/graycode_binarycode_RTLSchematic.png)

* Synthesis Schematic:
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/GrayCode_BinaryCode/picture/graycode_binarycode_SynthesisShematic.png)
