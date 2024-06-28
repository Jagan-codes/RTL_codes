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
