//design
module data_types(input [3:0] a,b,input clk,output reg sum[4:0] ,output reg overflow);
  reg [4:0] temp_sum;
  always@(posedge clk)
    begin 
      temp_sum=a+b;
      sum=temp_sum;
      overflow=sum[4];
    end
endmodule
      
      
  
//testbench
module data_types_tb;
  reg[3:0] a,b;
  reg clk;
  wire sum[4:0];
  wire overflow;
  
module data_types uut(.a(a),.b(b),.clk(clk),.sum(sum),.overflow(overflow));
    initial begin 
      clk=0;
      forever #5 
        clk=~clk;
    end
    initial begin 
      $monitor("time=%0t a=%b b=%b clk=%d sum=%b overflow=%b",$time,a,b,clk,sum,overflow);
      $dumpfile("dump.vcd");
      $dumpvars(1);
      a=4'b1111;b=4'b1111;#10;
      a=4'b0011;b=4'b0011;#10;
      a=4'b1100;b=4'b1100;#10;
      a=4'b1001;b=4'b1001;#10;
      a=4'b1010;b=4'b1010;#10;
      a=4'b0101;b=4'b0101;
    end
  endmodule