module SEQUENCE_GENERATOR_tb;
  reg clk;
  reg reset;
  wire [3:0] q;
  
  SEQUENCE_GENERATOR DUT(clk,reset,q);
  initial begin
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b q=%b ",$time,clk,reset,q);
    $dumpfile("SEQUENCE_GENERATOR.vcd");
    $dumpvars(1);
    
    clk=0;
    reset=1;
    #10;
    reset=0;
    
    #200;
    
    $finish;
  end
endmodule