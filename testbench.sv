`timescale 1ns / 1ps

module traffic_light_tb;
  reg clk;
  reg reset;
  wire red, yellow, green;

  traffic_light_controller uut (
    .clk(clk), .reset(reset),
    .red(red), .yellow(yellow), .green(green)
  );

  always #5 clk = ~clk;

  initial begin
    // Enable VCD dumping
    $dumpfile("dump.vcd");
    $dumpvars(0, traffic_light_tb);

    $display("Starting simulation...");
    $monitor("Time=%0t | RED=%b GREEN=%b YELLOW=%b", $time, red, green, yellow);

    clk = 0; reset = 1;
    #10 reset = 0;
    #500;
    $display("Done.");
    $finish;
  end
endmodule
