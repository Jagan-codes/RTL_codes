module check_palindrome_tb;
  reg [7:0]num;
  wire p_out;
  
  check_palindrome DUT(num,p_out);
  initial begin
    $monitor("time=%0t num=%b p_out=%b",$time,num,p_out);
    $dumpfile("check_palindrome.vcd");
    $dumpvars(1);
    
    num=8'd18;#10;
    num=8'd129;#10;
    num=8'd47;#10;
    num=8'd240;#10;
    num=8'd255;#10;
    num=8'd78;#10;
    num=8'd195;#10;
    num=8'd15;#10;
    $finish;
  end
endmodule