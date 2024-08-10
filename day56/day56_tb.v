module round_robin_arbitor_tb;
  reg clk;
  reg reset;
  reg [3:0] r;
  wire [3:0]g;
  
  round_robin_arbitor DUT(clk,reset,r,g);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b r=%b g=%b ",$time,clk,reset,r,g);
    $dumpfile("round_robin_arbitor.vcd");
    $dumpvars(1);
    
    reset=1;
    r=4'b0000;
    #10;
    
    reset=0;
    #10;
    
    r=4'b0001;
    #10;
    
    r=4'b0010;
    #10;
    
    r=4'b0100;
    #10;
    
    r=4'b1000;
    #10;
    
    r=4'b1100;//multiple request;
    #10;
     
    reset=1;
    #10;
    
    reset=0;
    r=4'b1010;
    
    $finish;
    
  end
endmodule
    
    