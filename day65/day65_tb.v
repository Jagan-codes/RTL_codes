module dual_edge_trigger_tb;
  reg clk;
  reg reset,d;
  wire q;
  
  dual_edge_trigger DUT(clk,reset,d,q);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b d=%b q=%b",$time,clk,reset,d,q);
    $dumpfile("dual_edge_trigger.vcd");
    $dumpvars(1);
    
    reset=1;
    #10;
    reset=0;
    #100;
    $finish;
    
  end
  
  initial begin
    d=0;
    forever #10 d=~d;
    
  end
endmodule