module bcd_to_7segment(
  input [3:0] bcd,
  output reg [6:0]seg_out
);
  always@(*)
    begin
      case(bcd)
          4'b0000:seg_out<=7'b0111111;
          4'b0001:seg_out<=7'b0000110;
          4'b0010:seg_out<=7'b1011011;
          4'b0011:seg_out<=7'b1001111;
          4'b0100:seg_out<=7'b1100110; 
          4'b0101:seg_out<=7'b1101101;
          4'b0110:seg_out<=7'b1111101;
          4'b0111:seg_out<=7'b0000111;
          4'b1000:seg_out<=7'b1111111;
          4'b1001:seg_out<=7'b1101111;
          default:seg_out<=7'b0000000;
      endcase
    end
endmodule
                    

                    

  