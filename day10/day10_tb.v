module digitalclock_tb;
  reg clk,reset;
  wire [3:0] count;
  
  digital_clock uut(.clk(clk),.reset(reset),.count(count));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  
  initial begin
    $monitor("time =%0t clk=%d reset=%d count=%b",$time,clk,reset,count);
    $dumpfile("digital_clock.vcd");
    $dumpvars(1);
    reset=1;
    #11;
    reset=0;
    
    #100;
    reset=1;
    #11;
    reset=0;
    
    #100;
    $finish;
  end
endmodule
    
    
    
            
  