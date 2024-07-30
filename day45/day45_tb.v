module  serial_adder_tb;
  reg clk;
  reg reset;
  reg a;
  reg b;
  reg start;
  wire cout;
  wire sum;
  
  serial_adder DUT(clk,reset,a,b,start,cout,sum);
  
  initial begin
    forever #5 clk=~clk;
  end
  initial begin
    $monitor("time=%0t clk=%b reset=%b a=%b b=%b start=%b cout=%b sum=%b ",$time,clk,reset,a,b,start,cout,sum);
    $dumpfile("serial_adder.vcd");
    $dumpvars(1);
    
    clk=0;
    reset=1;
    start=0;
    a=0;
    b=0;
    #10;
    reset=0;
    start=1;
    a=1;b=0;#10;
    a=0;b=1;#10;
    a=1;b=1;#10;
    a=0;b=0;
    #20;
    $finish;
  end
endmodule
    
    