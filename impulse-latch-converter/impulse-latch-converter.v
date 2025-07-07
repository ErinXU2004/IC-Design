// 电平与脉冲互相转换（可选模式）
module level_pulse_selector (
  input  wire clk,        // 时钟信号
  input  wire rst_n,      // 异步低有效复位
  input  wire d,          // 输入电平信号
  input  wire clear,      // 清除信号（仅用于脉冲转电平）
  input  wire pulse,      // 输入脉冲信号（用于电平锁存）
  input  wire mode,       // 模式选择：0 = 电平转脉冲，1 = 脉冲转电平

  output wire pos_edge,   // 上升沿
  output wire neg_edge,   // 下降沿
  output wire any_edge,   // 任意边沿
  output reg  level_flag  // 脉冲转电平输出
);

  // 前一周期 d 值
  reg d_reg;

  always @(posedge clk) begin
    d_reg <= d;
  end

  // 原始边沿检测信号
  wire pos_edge_raw = ~d_reg & d;
  wire neg_edge_raw = d_reg & ~d;
  wire any_edge_raw = d_reg ^ d;

  // 根据 mode 控制是否输出边沿信号
  assign pos_edge = (mode == 1'b0) ? pos_edge_raw : 1'b0;
  assign neg_edge = (mode == 1'b0) ? neg_edge_raw : 1'b0;
  assign any_edge = (mode == 1'b0) ? any_edge_raw : 1'b0;

  // 脉冲转电平，只有在 mode = 1 时有效
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      level_flag <= 1'b0;
    else if (mode == 1'b1) begin
      if (clear)
        level_flag <= 1'b0;
      else if (pulse)
        level_flag <= 1'b1;
    end
    else begin
      level_flag <= 1'b0; // 非此模式时输出归零
    end
  end

endmodule
