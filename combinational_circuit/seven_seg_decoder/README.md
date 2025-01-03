### 七段数码管译码器

实现七段共阴极数码管译码电路

```systemverilog
/*
    a
    ——
f |    | b   
    ——  ------> g
e |    | c
    ——
    d
*/
```

![]()

输入端口:

* din[3:0]: 4位8421BCD码输入端口

* en: 译码使能端口

* rstn: 复位端口，低电平有效

输出端口:

* dout[6:0]: 7位数码管位选输出端口

* out_en: 译码输出使能端口，高电平表示译码输出有效


译码对应规则：

| 十进制 | BCD码 | 7位段选码(g f e d c b a) |
| ----- | ----- | ------- |
| 0 | 0000 | 011_1111 |
| 1 | 0001 | 000_0110 |
| 2 | 0010 | 101_1011 |
| 3 | 0011 | 100_1111 |
| 4 | 0100 | 110_0110 |
| 5 | 0101 | 110_1101 |
| 6 | 0110 | 111_1101 |
| 7 | 0111 | 000_0111 |
| 8 | 1000 | 111_1111 |
| 9 | 1001 | 110_1111 |
| 10(a) | 1010 | 111_0111 |
| 11(b) | 1011 | 111_1100 |
| 12(c) | 1100 | 101_1000 |
| 13(d) | 1101 | 101_0001 |
| 14(e) | 1110 | 111_1001 |
| 15(f) | 1111 | 111_0001 |

* 仿真结果：


![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/seven_seg_decoder/pictures/seven_seg_decoder_testbench.png)

* RTL Schematic:

![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/seven_seg_decoder/pictures/seven_seg_decoder_RTLSchematic.png)

* Synthesis Schematic:

![](https://github.com/Spider-Viper/Digital-Lab/blob/main/combinational_circuit/seven_seg_decoder/pictures/seven_seg_decoder_SynthesisSchematic.png)


