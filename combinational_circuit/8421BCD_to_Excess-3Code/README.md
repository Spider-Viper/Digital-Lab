### 余三码转换电路

* 将4位8421BCD码转换为余3码

![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/8421BCD_to_Excess-3Code/pictures/8421BCD-to-Excess3Code.png)

* 端口功能描述:
    * 输出端口:
        * dout[3:0]: 输出4位余三码 
        * out_en: 输出使能端口，当为高电平时，表明输出有效
    * 输入端口:
        * din[3:0]: 4位8421BCD码输入端口
        * en: 模块使能端口
        * rstn: 复位端口，低电平有效

* 4位8421BCD码与余3码转换表：

| 8421BCD | 余三码  |
| ------  | ------ |
| 0000    | 0011   |
| 0001    | 0100   |
| 0010    | 0101   |
| 0011    | 0110   |
| 0100    | 0111   |
| 0101    | 1000   |
| 0110    | 1001   |
| 0111    | 1010   |
| 1000    | 1011   |
| 1001    | 1100   |
| 1010    | 1101   |
| 1011    | 1110   |
| 1100    | 1111   |
| 1101    | 0000   |
| 1110    | 0001   |
| 1111    | 0010   |

* 仿真结果：
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/8421BCD_to_Excess-3Code/pictures/8421BCDtoExcess3Code.png)

* RTL Shematic:
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/8421BCD_to_Excess-3Code/pictures/8421BCDtoExcess3Code_RTL_Schematic.png)

* Synthesis Schematic:
![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/8421BCD_to_Excess-3Code/pictures/8421BCDtoExcess3Code_Synthesis_Schematic.png)
