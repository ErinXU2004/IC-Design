# 🧠 Verilog 设计语法

## 📌 1. 可综合的 Verilog 基础语法
**可综合**指可以变成电路的Verilog
### ✅ 支持综合的常用结构
- `module` / `endmodule`
- `input`, `output`, `wire`, `reg`
- `assign`（组合逻辑）
- `always @(posedge clk)`（时序逻辑）
- `case`, `if`, `for`（条件和选择结构）

### 🚫 不建议或不能综合的内容
- `initial` 块（仅仿真用）
- `$display`, `$monitor`, `$finish` 等系统任务
- 延时语句 `#5`（仿真延迟，不可综合）

---

## 🧠 2. 寄存器的深度解读
- 寄存器对时钟的上升沿和复位的下降沿敏感
- 单沿触发: 对时钟要求快，但对时钟形状要求低，不容易出错
- 双沿触发: 指整个电路的双沿，而非单个触发器，要求时钟是50%占空比
### ✅ 定义寄存器变量
```verilog
reg [7:0] data_reg;
always @(posedge clk or negedge rst_n) begin
  if (!rst_n)
    data_reg <= 8'd0;
  else if (load)
    data_reg <= data_in;
end
```

## 🔄 3. 阻塞与非阻塞赋值的区别
| 项目     | 阻塞赋值（`=`）     | 非阻塞赋值（`<=`） |
| ------ | ------------- | ----------- |
| 执行顺序   | 顺序执行（模拟 C 语法） | 并行调度（按事件队列）同时发生 |
| 适用范围   | 组合逻辑          | 时序逻辑（推荐）    |
| 使用场景示例 | `a = b;`      | `q <= d;`   |
```verilog
// 阻塞：组合逻辑中可用
always @(*) begin
  a = b & c;       //这里没有阻塞关系，但如果写成<=会语法报错
  y = a | d;
end
```

## ⚡ 4. 组合逻辑两种表达方式
```verilog
always @(*) begin
  if(s1)
    a = 1;
  else
    a = 0;
end
```
等同于
```verilog
  assign a = s1? 1 ; 0;
```
always表达更加清晰
### ✅ 建议书写规范
- 用 reg 定义所有在 always 块中赋值的变量
- 用 wire 定义 assign 所用的信号
- 明确同步/异步复位，写法保持一致性
- 避免混用阻塞与非阻塞赋值于一个 always 块中


## 🎯 5. 组合逻辑中的选择器（多路选择）

### ✅ 方法一：使用 `if-else`
适合用于***优先级明确***的逻辑判断。
```verilog
always @(*) begin
  if (sel == 2'b00)
    y = a;
  else if (sel == 2'b01)
    y = b;
  else if (sel == 2'b10)
    y = c;
  else
    y = 0;
end
```

### ✅ 方法二：使用 case
适合用于***优先级相同***的选择器逻辑。
```verilog
always @(*) begin
  case (sel)
    2'b00: y = a;
    2'b01: y = b;
    2'b10: y = c;
    default: y = 0;
  endcase
end
```

### ✅ 方法三：使用 casez（带通配符）
适合用于有***X或don't care位***的匹配判断
```verilog
always @(*) begin
  casez (opcode)
    4'b1???: y = a; // 最高位为1，其他不关心
    4'b01??: y = b;
    default: y = c;
  endcase
end
```

## 6. for 循环在 Verilog 中的使用
### 一次复制多个逻辑的for循环
```verilog
genvar i; //复制次数，作为变量出现
generate
  for (i = 0; i < 4; i = i + 1)
  begin : gen_block //generate块的名称
    and u_and (.a(in1[i]), .b(in2[i]), .y(out[i])); //只要出现i，电路逻辑就会被复制
  end
endgenerate
```

## 7. 🔢 Verilog 数值表示方式总结

在 Verilog 中，数值表示遵循一种结构化格式：<位宽>'<进制><数值>
## ✅ 基本格式

| 示例         | 说明                             |
|--------------|----------------------------------|
| `8'b10101010` | 8位宽，二进制值10101010          |
| `4'd9`        | 4位宽，十进制值9（即1001）       |
| `6'o17`       | 6位宽，八进制值17（即001111）      |
| `8'hA3`       | 8位宽，十六进制值A3（即10100011）|

### 特殊数值表示法
```verilog
{5{1'b0}} //5个bit 0
{kkk{1'b0}} //如果有一个参数叫kkk
assign int_clr = 2{{apb ==  4'd7} & wr_en} & apb_wdat[1:0]; //Copy {apb ==  4'd7} & wr_en} into two bits
```

### ⚠️ 特殊符号值：X 和 Z
- X：表示未知（可能是仿真过程中的未定义）
- Z：表示高阻态, 不会干扰到其他信号传输到状态
```verilog
8'bxxxx_xxxx  // 未知值
4'bzzzz       // 高阻态
```


