module seven_segment_rom #(
  parameter addr_width=16,
  parameter addr_bits=4,
  parameter data_width=8)(
  input [addr_bits-1:0]addr,
  output reg [data_width-1:0]data);
  
  always@(addr)
    begin
      case(addr)
          4'h0:data=7'b0111111;
          4'h1:data=7'b0000110;
          4'h2:data=7'b1011011;
          4'h3:data=7'b1001111;
          4'h4:data=7'b1100110;
          4'h5:data=7'b1101101;
          4'h6:data=7'b1111101;
          4'h7:data=7'b0000111;
          4'h8:data=7'b1111111;  
          4'h9:data=7'b1101111;
          4'ha:data=7'b1110111;
          4'hb:data=7'b1111100;
          4'hc:data=7'b0111001;
          4'hd:data=7'b1011110;
          4'he:data=7'b1111001;
          4'hf:data=7'b1110001; 
          default: data=7'b00000000;
      endcase
    end
endmodule