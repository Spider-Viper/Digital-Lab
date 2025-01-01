### 4线-10线BCD译码器
* 将4位BCD码转换为10位独热码

* 输入信号：
    * din： 4位BCD码输入信号
    * en： 译码使能信号，高电平有效
    * rstn： 复位信号，低电平有效
* 输出信号：
    * dout：10位独热码输出信号。无效编码信号为：00_0000_0000
    * dout_en：输出使能信号，高电平有效。即：当out_en为高电平时，输出有效译码信号。

 ![](https://github.com/Spider-Viper/Digital-Lab/blob/main/%E7%BB%84%E5%90%88%E9%80%BB%E8%BE%91%E7%94%B5%E8%B7%AF/%E8%AF%91%E7%A0%81%E5%99%A8/picture/decoder4_10.png)

 v1.0 RTLSchematic:
 
 ![](https://github.com/Spider-Viper/Digital-Lab/blob/main/%E7%BB%84%E5%90%88%E9%80%BB%E8%BE%91%E7%94%B5%E8%B7%AF/%E8%AF%91%E7%A0%81%E5%99%A8/picture/decoder4_10_v1_RTLSchematic.png)

 v1.0 SynthesisSchematic:
 
 ![](https://github.com/Spider-Viper/Digital-Lab/blob/main/%E7%BB%84%E5%90%88%E9%80%BB%E8%BE%91%E7%94%B5%E8%B7%AF/%E8%AF%91%E7%A0%81%E5%99%A8/picture/decoder4_10_v1_SynthesisSchematic.png)

 v1.0 Utilization:
 
 ![](https://github.com/Spider-Viper/Digital-Lab/blob/main/%E7%BB%84%E5%90%88%E9%80%BB%E8%BE%91%E7%94%B5%E8%B7%AF/%E8%AF%91%E7%A0%81%E5%99%A8/picture/decoder4_10_v1_Utilization.png)

 v1.0 Power:
 
 ![](https://github.com/Spider-Viper/Digital-Lab/blob/main/%E7%BB%84%E5%90%88%E9%80%BB%E8%BE%91%E7%94%B5%E8%B7%AF/%E8%AF%91%E7%A0%81%E5%99%A8/picture/decoder4_10_v1_Power.png)

v2.0 RTLSchematic:

![](https://github.com/Spider-Viper/Digital-Lab/blob/main/%E7%BB%84%E5%90%88%E9%80%BB%E8%BE%91%E7%94%B5%E8%B7%AF/%E8%AF%91%E7%A0%81%E5%99%A8/picture/decoder4_10_v2_RTLSchematic.png)

v2.0 SynthesisSchematic:

![](https://github.com/Spider-Viper/Digital-Lab/blob/main/%E7%BB%84%E5%90%88%E9%80%BB%E8%BE%91%E7%94%B5%E8%B7%AF/%E8%AF%91%E7%A0%81%E5%99%A8/picture/decoder4_10_v2_SynthesisSchematic.png)

v2.0 Utilization:

![](https://github.com/Spider-Viper/Digital-Lab/blob/main/%E7%BB%84%E5%90%88%E9%80%BB%E8%BE%91%E7%94%B5%E8%B7%AF/%E8%AF%91%E7%A0%81%E5%99%A8/picture/decoder4_10_v2_Utilization.png)

v2.0 Power:

![](https://github.com/Spider-Viper/Digital-Lab/blob/main/%E7%BB%84%E5%90%88%E9%80%BB%E8%BE%91%E7%94%B5%E8%B7%AF/%E8%AF%91%E7%A0%81%E5%99%A8/picture/decoder4_10_v2_power.png)
