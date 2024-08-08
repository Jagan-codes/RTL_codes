module GCD(
  input [7:0]a,
  input [7:0]b,
  output reg[7:0]gcd_o
);
  reg [7:0]x,y;
  always@(*)
    begin
      
      x=a;
      y=b;
      
      while(y!=0)
        begin
          if(x>y)
            x=x-y;
          else
            y=y-x;
        end
      gcd_o=x;
    end
endmodule