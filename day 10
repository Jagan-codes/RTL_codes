//design
module digital_clock(input clk,reset,output reg [3:0] count);
  
  reg [3:0] next_count;
  always@(posedge clk or posedge reset)//sequential block
    begin
      if(reset)
        count<=8'b0000;
      else
        count<=next_count;
    end
  
  always@(*)//combinational block
    begin
      if(count==4'b1111)
        next_count=8'b0000;
      else
        next_count=count+1;
    end
  
  reg led;
  always@(posedge clk or posedge reset)//sequential block for led 
    begin
      if(count==4'b1000)
        led<=1'b1;
      else
        led<=1'b0;
    end
endmodule
//testbench
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
    #10;
    reset=0;
    
    #160;
    reset=1;
    #11;
    reset=0;
    
    #100;
    $finish;
  end
endmodule
    
    
    
            
  
      
        