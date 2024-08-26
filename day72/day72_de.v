module check_prime(
  input clk,
  input reset,
  input [7:0]num,
  output reg is_prime
);
  integer i;
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        is_prime<=0;
      else if(num==2)
        is_prime<=1;
      else
        begin
          is_prime<=1;
          for(i=2;i<num/2;i=i+1)
            begin
              if(num%2==0)
                is_prime<=0;
            end
        end
    end
endmodule