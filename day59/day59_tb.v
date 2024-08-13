module dynamic_priority_arbiter_tb;
  reg clk;
  reg reset;
  reg [3:0]req;
  wire [3:0]gnt;
  
  dynamic_priority_arbiter DUT(clk,reset,req,gnt);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b req=%b gnt=%b",$time,clk,reset,req,gnt);
  $dumpfile("dynamic_priority_arbiter.vcd");
  $dumpvars(1);
  reset=1;
  req=4'b0000;
  #10;
  req=0;
  
  req=4'd8;
  #10;
  
  req=4'd4;
  #10;
  
  req=4'd2;
  #10;
  
  req=4'd1;
  #10;
  
  req=4'd15;
  #10;
  
  reset=1;
  #10;
  $finish;
  end
endmodule