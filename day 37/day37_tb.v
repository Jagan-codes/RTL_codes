module PIPO_shift_reg_tb;
  reg clk;
  reg reset;
  reg [7:0] d;
  output [7:0] q;
  
  PIPO_shift_reg dut(clk,reset,d,q);
  initial begin
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b d=%b q=%b ",$time,clk,reset,d,q);
    $dumpfile("PIPO_shift_reg.vcd");
    $dumpvars(1);
    
    clk=0;
    reset=1;
    #10;
    reset=0;
    d=8'h9;
    #10;
    d=8'ha_a;
    #10;
    d=8'hf_f;
    #10;
    d=8'hd_d;
    #10;
    d=8'he_e;
    #10;
    d=8'h7;
    #10;
    d=8'hff;
    #10;
    $finish;
  end
endmodule