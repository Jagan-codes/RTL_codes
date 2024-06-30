module down_counter_tb;
  reg reset,clk;
  wire [3:0]count;
  
  down_counter  uut (.reset(reset),.clk(clk),.count(count));
  initial begin
    forever #5 clk=~clk;
  end
  
  initial begin
    clk=0;
    reset=0;
    
    $monitor("time=%0t reset=%d clk=%d count=%d",$time,reset,clk,count);
    $dumpfile("downcounter.vcd");
    $dumpvars(1);
    
    #5;
    reset=1;
    #10;
    reset=0;
    
    #100;
    $finish;
  end
endmodule
