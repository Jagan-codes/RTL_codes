module gray_counter(
  input clk,
  input reset,
  output reg [3:0]gray_count
);
  
  reg [3:0]bin_count;
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        begin
          bin_count<=4'b0000;
          gray_count<=4'b0000;
        end
      else
        begin
          bin_count<=bin_count+1;
          gray_count<={bin_count[3],bin_count[3]^bin_count[2],bin_count[2]^bin_count[1],bin_count[1]^bin_count[0]};
        end
    end
endmodule
          
          
      