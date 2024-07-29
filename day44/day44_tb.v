module johnson_counter_tb;
  reg clk;
  reg reset;
  wire [3:0]out;
  
  johnson_counter DUT(clk,reset,out);
  initial begin
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t  clk=%b reset=%b out=%b ",$time,clk,reset,out);
    $dumpfile("johnson_counter.vcd");
    $dumpvars(1);
    
    clk=0;
    reset=1;
    #10;
    
    reset=0;
    
    #100;
    $finish;
  end
endmodule