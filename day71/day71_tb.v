module lifo_tb;
  reg clk;
  reg reset;
  reg push;
  reg pop;
  reg [7:0]data;
  wire [7:0]data_out;
  wire empty;
  wire full;
  
  lifo DUT(clk,reset,push,pop,data,data_out,empty,full);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b push=%b pop=%b data=%b data_out=%b empty=%b full=%b",$time,clk,reset,push,pop,data,data_out,empty);
    $dumpfile("lifo.vcd");
    $dumpvars(1);
    
    reset=1;
    #10;
    
    reset=0;
    push=1;
    data=8'd78;#10;
    data=8'd45;#10;
    data=8'd18;#10;
    data=8'd15;#10;
    data=8'd90;#10;
    data=8'd21;#10;
    data=8'd100;#10;
    push=0;
    #10;
    pop=1;
    #90;
    pop=0;
    $finish;
  end
endmodule