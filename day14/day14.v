module down_counter(input reset,clk,output reg [3:0] count);//down counter
  always@(posedge clk or posedge reset)
    begin
      if(reset)
        begin
          count<=4'b1111;//reset to 15
        end
      else
        count<=count-1;
    end
endmodule
