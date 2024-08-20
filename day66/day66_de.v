module bcd_to_binary(
  input [11:0]bcd,
  output reg[7:0]binary
);
  integer i;
  reg [7:0]t_b;
  always@(bcd)
    begin
      t_b=8'd0;//temperory binary
      binary=8'd0;
      for(i=0;i<12;i=i+1)
        begin
          t_b={t_b[6:0],bcd[11-i]};
          if(i==3 ||i==7||i==11)
            begin
              binary=binary+t_b*(1<<((11-i)/4*3));
            end
        end
    end
endmodule