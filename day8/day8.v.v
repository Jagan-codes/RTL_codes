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

  
              
  