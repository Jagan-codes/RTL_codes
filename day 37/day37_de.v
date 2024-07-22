module PIPO_shift_reg(
  input clk,//clock input
  input reset,
  input [7:0] d,//parallel input
  output reg [7:0] q//parallel output
);
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        q=8'h0;
      else
        q=d;
    end
endmodule
  