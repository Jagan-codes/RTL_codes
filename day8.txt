//design
//behaviour modeling
module counter_8(input clk,reset,output reg [7:0] count);
  always@(posedge clk or posedge reset)
    begin
      if(reset)
        count<=8'b00000000;
      else
        count<=count+1;
    end
endmodule

//testbench
module counter_8_tb;
  reg clk,reset;
  wire [7:0] count;
  counter_8 uut(.clk(clk),.reset(reset),.count(count));
  initial begin
    clk=0;
    reset=0;
    $monitor("time=%0t clk=%d reset=%d count=%d ",$time,clk,reset,count);
    $dumpfile("dump.vcd");
    $dumpvars(1);
    reset=1;#10;
    reset=0;#10;
    reset=0;#10;
    reset=1;#10;
              
    #25;
    $finish;
  end
    always #5 clk=~clk;
endmodule
              
              
  