module clock_Buffer(
  input clk_in,
  output clk_out
);
  buf(clk_out,clk_in);
endmodule