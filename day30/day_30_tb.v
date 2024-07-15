module clock_divider_tb;
  reg clk,reset;
  reg div_2,div_4,div_8,div_16;
  
  clock_divider dut(clk,reset,div_2,div_4,div_8,div_16);
  initial begin
    forever #2 clk=~clk;
  end
  initial begin
    $monitor("time=%0t clk=%b reset=%b div_2=%b div_4=%b div_8=%b div_16=%b",$time,clk,reset,div_2,div_4,div_8,div_16);
    $dumpfile("clock_divider.vcd");
    $dumpvars(1);
    
    clk=0;
    reset=1;
    
    #5;
    reset=0;
    #100;
    $finish;
  end
endmodule