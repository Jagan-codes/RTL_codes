module SISO_shift_reg(
  input clk,
  input reset,
  input serial_in,
  output serial_out
);
  reg [7:0] shift_reg;
  
  always@(posedge clk or posedge reset)
    begin
      if(reset)
        shift_reg=8'h0;
      else
        shift_reg={shift_reg[6:0],serial_in};
      
    end
  
  assign serial_out=shift_reg[7];
endmodule