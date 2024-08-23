module clock_phasing_tb;
  reg clk,reset;
  wire clk_0,clk_90,clk_180,clk_270;
  
  clock_phasing DUT(clk,reset,clk_0,clk_90,clk_180,clk_270);
  
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b clk_0=%b clk_90=%b clk_180=%b clk270=%b",$time,clk,clk_0,clk_90,clk_180,clk_270);
    $dumpfile("lock_phasing_tb.vcd");
    $dumpvars(1);
    
    reset=1;
    #10;
    reset=0;
    #50;
    reset=1;
    #10;
    reset=0;
    #50;
    $finish;
  end
endmodule
    