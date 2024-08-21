module bcd_to_excess_3converter(
  input [3:0]in,
  output reg[3:0]out,
  output reg valid,
  output reg error
);
  
  always@(in)
    begin
      if(in<=4'b1001)
        begin
          out=in+2'b11;
          valid=1'b1;
          error=1'b0;
        end
      else
        begin
          out<=4'bxxxx;
          valid=1'b0;
          error=1'b1;
        end
    end
endmodule