module priority_encoder(input [0:7] d,output reg [0:2] y);
  always@(*)
    begin
      casez(d)
        8'b1zzzzzzz:y=3'h0;
        8'bz1zzzzzz:y=3'h1;
        8'bzz1zzzzz:y=3'h2;
        8'bzzz1zzzz:y=3'h3;
        8'bzzzz1zzz:y=3'h4;
        8'bzzzzz1zz:y=3'h5;
        8'bzzzzzz1z:y=3'h6;
        8'bzzzzzzz1:y=3'h7;
      endcase
    end
endmodule


  
  