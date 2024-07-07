module fulladder_tb;
  reg a,b,cin;
  wire sum,carry;
  fulladder dut(a,b,cin,sum,carry);
  initial begin
    $monitor("time =%0t a=%b b=%b cin=%b sum=%b carry=%b",$time,a,b,cin,sum,carry);
    $dumpfile("fulladder.vcd");
    $dumpvars(1);
    a=1;b=0;cin=0;#1;
    a=0;b=0;cin=1;#1;
    a=0;b=1;cin=0;#1;
    a=1;b=1;cin=0;#1;
    a=1;b=0;cin=1;#1;
    a=1;b=1;cin=1;#1;
    $finish;
  end
endmodule
