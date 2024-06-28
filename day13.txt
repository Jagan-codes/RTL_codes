//design
module upcounter(input reset,clk,output reg [3:0] count);
  always@(posedge clk or posedge reset)//4-bit UP-COUNTER
    begin
      if(reset)
        begin
        	count<=4'b0000;
        end
      else
        count<=count+4'b0001;
    end
endmodule
//testbench
module upcounter_tb;
  reg reset,clk;
  wire [3:0] count;
  
  upcounter  uut(.reset(reset),.clk(clk),.count(count));
  
  initial begin
    forever #5 clk=~clk;
  end
  
  initial begin
    clk=0;
    reset=0;
    
    $monitor("time=%0t reset=%d clk=%d count=%d",$time,reset,clk,count);
    $dumpfile("dump.vcd");
    $dumpvars(1);
    #5;
    reset=1;
    #10
    reset=0;
    #100;
    
    $finish;
    
  end
  
endmodule
    
  
      

    