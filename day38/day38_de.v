module PISO_shift_reg(
  input clk,
  input reset,
  input load,//parallel input 
  input  [7:0]d,
  output q);
  
  reg [7:0] shift_right;
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        shift_right<=8'h0;
      else if(load)
        shift_right<=d;
      else
        shift_right<={d[6:0],1'b0};
    end
  
  assign q= shift_right[7];
endmodule
        
  
  