module even_or_odd(
  input [3:0]number,
  output reg [3:0]even_odd
);
  
  parameter even=1'b1,odd=1'b0;
  
  always@(number)
    begin
      even_odd= check_odd_even(number);
      if(even_odd==1'b1)
        $display("\t %d is an even number",number);
      else
        $display("\t %d is an odd number",number);
    end
  
        
  
  function check_odd_even;
    input [3:0]num;
    begin
      if(num%2==0)
        check_odd_even=even;
      else
        check_odd_even=odd;
    end
  endfunction
endmodule
  
  