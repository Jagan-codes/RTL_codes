//testbench
  module Traffic_light_tb;
  reg clk,reset;
  wire [2:0] light;
  Traffic_light uut(.clk(clk),.reset(reset),.light(light));
  initial begin
    clk=0;
    reset=1;
    $monitor("time:%0t clk=%b reset=%b light=%b",$time,clk,reset,light);
    $dumpfile("dump.vcd");
    $dumpvars(1);
    #10
    reset=0;#10;
   #10;
    #100;
    $finish;
    end
  always #5 clk=~clk;
endmodule