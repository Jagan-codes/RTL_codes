module SEQUENCE_GENERATOR(
  input clk,
  input reset,
  output reg [3:0] q
);
  
  reg [4:0] count;
  
  always@(posedge clk)
    begin
      if(reset)
        count<=4'b0000;
      else
        begin
          if(count==4'b1111)
            count<=4'h0;
          else
            count<=count+1;
        end
      q<=count;
    end
endmodule