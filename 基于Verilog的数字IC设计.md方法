# 💡 Verilog 语法与数字器件的对应关系笔记

---

## 🔗 Verilog 是什么？

> Verilog 是一种硬件描述语言（HDL），本质上是“用代码描述硬件”的工具。每一段 Verilog 代码最终都会被综合成**具体的数字逻辑器件**：与门、触发器、加法器、多路选择器等。

---

## 🧠 Verilog 语法与器件关系总览

| Verilog 结构 | 对应的数字器件 | 特点 |
|--------------|----------------|------|
| `assign`（连续赋值） | 组合逻辑器件（与门、或门、MUX 等） | 无需时钟 |
| `always @(*)` | 组合逻辑（复杂逻辑组合） | 自动推导组合逻辑 |
| `always @(posedge clk)` | 时序逻辑（触发器/寄存器） | 有时钟控制，构成状态机 |
| `if-else` | 控制路径选择（MUX） | 综合为多路选择器 |
| `case` 语句 | 多路选择器（MUX） | 条件判断，生成组合逻辑 |
| `reg` 类型 + `posedge clk` | D触发器 | 存储器件 |
| `wire` 类型 | 信号线 / 组合逻辑输出 | 不可赋值，连接用 |

---

## 🔟 常见数字逻辑器件及 Verilog 实现示例

### 1. **与门（AND gate）**
```verilog
assign y = a & b;
```

2. 或门（OR gate）
```verilog
assign y = a | b;
```

3. 非门（NOT gate / inverter）
```verilog
assign y = ~a;
```
4. 异或门（XOR gate）
```verilog
assign y = a ^ b;
```

5. 与非门（NAND gate）
```verilog
assign y = ~(a & b);
```

6. 或非门（NOR gate）
```verilog
assign y = ~(a | b);
```
7. 多路选择器（Multiplexer）
```
verilog
assign y = sel ? a : b;
```
8. 加法器（Adder）
```
verilog
assign sum = a + b;
```
9. D触发器（D Flip-Flop）
```
verilog
always @(posedge clk) begin
    q <= d;
end
```
10. 计数器（Counter）
```
verilog
reg [3:0] cnt;
always @(posedge clk or posedge rst) begin
    if (rst)
        cnt <= 0;
    else
        cnt <= cnt + 1;
end
```
