module carry_skip_adder_tb;
  reg [3:0]a,b;
  reg cin;
  output [3:0]sum;
  output carry;
  
  carry_skip_adder DUT(a,b,cin,sum,carry);
  initial begin
    $monitor("time=%0t a=%b b=%b sum=%b carry=%b",$time,a,b,sum,carry);
    $dumpfile("carry_skip_adder.vcd");
    $dumpvars(1);
    
   	a=4'b1010;b=4'b1010;cin=1'b0;#10;
    a=4'b1110;b=4'b1110;cin=1'b1;#10;
    a=4'b1011;b=4'b1011;cin=1'b0;#10;
    a=4'b0110;b=4'b0110;cin=1'b1;#10;
    a=4'b1000;b=4'b1110;cin=1'b0;#10;
    a=4'b0100;b=4'b1111;cin=1'b1;#10;
    a=4'b1111;b=4'b1111;cin=1'b1;#10;
    a=4'b1010;b=4'b0000;cin=1'b0;#10;
    a=4'b1001;b=4'b1011;cin=1'b1;#10;
    $finish;
  end
endmodule
    