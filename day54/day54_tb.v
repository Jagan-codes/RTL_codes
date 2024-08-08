module GCD_tb;
  reg [7:0]a;
  reg [7:0]b;
  wire [7:0]gcd_o;
  
  
  GCD DUT(a,b,gcd_o);
  initial begin
    $monitor("time=%0t a=%d b=%d gcd_o=%d",$time,a,b,gcd_o);
    $dumpfile("GCD.vcd");
    $dumpvars(1);

    a=8'd10;b=8'd20;#10;
    a=8'd45;b=8'd5;#10;
    a=8'd75;b=8'd30;#10;
    a=8'd60;b=8'd20;#10;
    a=8'd17;b=8'd7;#10;
    a=8'd99;b=8'd30;#10;
    a=8'd35;b=8'd3;#10;
    $finish;
  end
endmodule