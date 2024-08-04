
module array_multiplier_tb;
  reg [3:0]a;
  reg [3:0]b;
  wire [7:0]z;
  
  array_multiplier DUT(a,b,z);
  
  initial begin
    $monitor("time=%0t a=%b b=%b z=%b",$time,a,b,z);
    $dumpfile("array_multiplier.vcd");
    $dumpvars(1);
    
    
    a=4'b0000;b=4'b0000;#10;//binary
    a=4'h1;b=4'h1;#10;//hexadecimal representation
    a=4'd2;b=4'd2;#10;//decimal representation
    a=4'd3;b=4'd3;#10;
    a=4'd4;b=4'd4;#10;
    a=4'd5;b=4'd5;#10;
    a=4'd6;b=4'd6;#10;
    a=4'd7;b=4'd7;#10;
    a=4'd8;b=4'd8;#10;
    a=4'd9;b=4'd9;#10;
    a=4'd10;b=4'd10;#10;
    a=4'hb;b=4'hb;#10;
    a=4'hc;b=4'hc;#10;
    a=4'hd;b=4'hd;#10;
    a=4'he;b=4'he;#10;
    a=4'hf;b=4'hf;#10;
    $finish;
  end
endmodule
    
    
    
  