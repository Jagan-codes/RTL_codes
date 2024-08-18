module binary_bcd(
  input [7:0]binary,
  output reg[11:0] bcd
);
  integer i;
  always@(binary)
    begin
      bcd=12'd0;
      for(i=7;i>=0;i=i-1)
        begin
          bcd={bcd[10:0],binary[i]};
          
          if(bcd[3:0]>5)
            bcd[3:0]=bcd[3:0]+3;
          else if(bcd[7:4]>5)
            bcd[7:4]=bcd[7:4]+3;
          else if(bcd[11:8]>5)
            bcd[11:8]=bcd[11:8]+3;
        end
    end
endmodule
            
          
