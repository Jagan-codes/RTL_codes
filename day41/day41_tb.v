module ring_counter_tb;
  reg clk;
  reg reset;
  wire [3:0] q;
  
  ring_counter DUT(clk,reset,q);
  initial begin
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b q=%b",$time,clk,reset,q);
    $dumpfile("ring_counter.vcd");
    $dumpvars(1);
    
    clk=0;
    reset=1;
    #10;
    reset=0;
    #70;
    reset=1;
  
    #80;
    $finish;
  end
endmodule