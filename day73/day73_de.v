module check_palindrome(
  input [7:0]num,
  output reg p_out
);
  always@(*)
    begin
      if(num=={num[0],num[1],num[2],num[3],num[4],num[5],num[6],num[7]})
        p_out=1;
      else
        p_out=0;
    end
endmodule