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
      
      
  
