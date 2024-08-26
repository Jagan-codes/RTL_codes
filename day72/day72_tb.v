module check_prime_tb;
  reg clk;
  reg reset;
  reg [7:0]num;
  wire is_prime;
  
  check_prime DUT(clk,reset,num,is_prime);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b num=%d is_prime=%b",$time,clk,reset,num,is_prime);
    $dumpfile("check_prime.vcd");
    $dumpvars(1);
    
    reset=1;
    #10;
    reset=0;
    num=8'd0;#10;
    num=8'd2;#10;
    num=8'd5;#10;
    num=8'd7;#10;
    num=8'd17;#10;
    num=8'd80;#10;
    num=8'd69;#10;
    num=8'd16;#10;
    num=8'd78;#10;
    num=8'd54;#10;
    num=8'd87;#10;
    $finish;
  end
endmodule
    
    
    
  