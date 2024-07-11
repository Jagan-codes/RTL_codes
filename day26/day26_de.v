module decoder(input [2:0] j,output reg [7:0] y);
  always@(j)
    begin
       y=0;
      case(j)
        3'h0:y[0]=1;
        3'h1:y[1]=1;
        3'h2:y[2]=1;
        3'h3:y[3]=1;
        3'h4:y[4]=1;
        3'h5:y[5]=1;
        3'h6:y[6]=1;
        3'h7:y[7]=1;
      endcase
    end
endmodule
        