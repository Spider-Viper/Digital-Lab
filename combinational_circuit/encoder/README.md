实现10线-4线BCD编码器

将10位独热码转换为4位二进制码

编码器具有普通编码器和优先编码器功能
优先编码器优先级由高到低依次为：din[9],din[8],din[7],din[6],din[5],din[4],din[3],din[2],din[1],din[0]

编码器端口：
- din: 10位待编码数据输入端口
- dout: 4位编码后二进制数据输出端口
- en: 编码器使能端口，高电平有效
- mode_sel: 模式选择端口，低电平为普通编码器，高电平为优先编码器
- out_en: 编码有效输出端口，当为高电平时，表明输出为有效编码

![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/encoder/picture/%E6%A1%86%E5%9B%BE.png)

Version 1:
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/encoder/picture/version%201/encoder10_4%20v1.png)
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/encoder/picture/version%201/encoder1-0_4%20utilization%20v1.png)
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/encoder/picture/version%201/encoder10_4%20power%20v1.png)

Version 2:
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/encoder/picture/version%202/encoder10_4%20v2.png)
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/encoder/picture/version%202/encoder10_4%20utilization%20v2.png)
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/encoder/picture/version%202/encoder10_4%20power%20v2.png)
