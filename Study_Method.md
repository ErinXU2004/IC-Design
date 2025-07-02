# 数字 IC 工程师的成长与提高路线

> 本文记录数字集成电路（Digital IC）方向的学习成长路线，适用于初学者逐步掌握 Verilog、FPGA 与 EDA 工具。

---

## 1️⃣ 学习方法：夯实基础

- 从 **Verilog HDL** 语法学习入门
  - 熟悉模块结构、端口定义、信号赋值（`assign`, `always`）
  - 学会仿真测试（testbench）

- 理解两种关键表达方式：
  - **电路表达（结构化建模）**：明确逻辑门电路的连接关系
  - **行为表达（行为级建模）**：描述逻辑行为，不强调具体电路结构

---

## 2️⃣ 进阶语言与工具使用

- 在掌握 Verilog 基础后：
  - 学习 **SystemVerilog**
    - 引入接口（interface）、断言（assertion）、更强表达力的数据结构
  - 学习 **FPGA 的使用流程**
    - 使用开发板进行综合、下载、调试
    - 了解开发平台如 Xilinx Vivado / Intel Quartus

---

## 3️⃣ 理解时序与约束

- 学习时序设计基本概念：
  - 建立时间、保持时间、时钟偏移、setup/hold violations
  - 时钟约束的编写方法（如 SDC）

- 使用 FPGA 的 EDA 软件进行时序分析：
  - 时钟频率计算
  - 路由优化
  - 时序仿真（Timing Simulation）

---

## 4️⃣ 熟悉常见 EDA 工具链

- 初步了解以下 EDA 工具：
  - **逻辑综合（Synthesis）**：将 Verilog 转为门级网表
  - **布局布线（Place & Route）**
  - **形式验证（Formal Verification）**
  - **静态时序分析（STA）**
  - **功耗分析、门级仿真**

- 常用工具示例：
  - Synopsys Design Compiler
  - Cadence Genus / Innovus
  - Mentor ModelSim
  - Xilinx Vivado / Quartus Prime

---

📌 建议配合学习平台如 [HDLBits](https://hdlbits.01xz.net/wiki/Main_Page)、Coursera 上的 FPGA 课程、以及项目实战同步提升。
