`timescale 1ns/1ps

module tb_level_pulse_selector;

  // DUT输入
  reg clk;
  reg rst_n;
  reg d;
  reg clear;
  reg pulse;
  reg mode;

  // DUT输出
  wire pos_edge;
  wire neg_edge;
  wire any_edge;
  wire level_flag;

  // 实例化被测试模块
  level_pulse_selector dut (
    .clk(clk),
    .rst_n(rst_n),
    .d(d),
    .clear(clear),
    .pulse(pulse),
    .mode(mode),
    .pos_edge(pos_edge),
    .neg_edge(neg_edge),
    .any_edge(any_edge),
    .level_flag(level_flag)
  );

  // 时钟生成
  initial clk = 0;
  always #5 clk = ~clk; // 10ns周期

  // 测试向量
  initial begin
    // 初始化
    rst_n = 0;
    d = 0;
    clear = 0;
    pulse = 0;
    mode = 0;
    #20;
    
    rst_n = 1;
    $display(">>> 测试电平转脉冲");
    #10 d = 1; // 上升沿
    #10 d = 0; // 下降沿
    #10 d = 1; // 上升沿
    #10 d = 1; // 保持高电平
    #10 d = 0; // 下降沿
    #10;

    // 切换为脉冲转电平模式
    mode = 1;
    $display(">>> 测试脉冲转电平");
    #10 pulse = 1;
    #10 pulse = 0;
    #20 clear = 1; // 清除状态
    #10 clear = 0;
    #10;

    $display(">>> 测试完成");
    $stop;
  end

endmodule
