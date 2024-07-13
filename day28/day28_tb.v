module LFSR_tb;
  reg clk,reset;
  wire [3:0] op;
  
  LFSR dut(clk,reset,op);
  initial begin
    forever #2 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b op=%b",$time,clk,reset,op);
    $dumpfile("LFSR.vcd");
    $dumpvars(1);
    
    clk=0;reset=1;
    #5;reset=0;
    
    #50;
    $finish;
  end
endmodule