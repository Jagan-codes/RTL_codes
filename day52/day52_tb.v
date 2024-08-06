module wallace_Tree_multiplier_tb;
  reg [3:0]a;
  reg [3:0]b;
  wire [7:0]y;
  
  wallace_Tree_multiplier DUT(a,b,y);
  initial begin
    $monitor("time=%0t a=%b b=%b y=%b",$time,a,b,y);
    $dumpfile("wallace_Tree_multiplier.vcd");
    $dumpvars(1);
    
    a=4'd15;b=4'd15;#10;
    a=4'd7;b=4'd7;#10;
    a=4'd5;b=4'd5;#10;
    a=-4'd5;b=-4'd5;#10;
    a=-4'd10;b=-4'd8;#10;
    a=4'd7;b=-4'd8;#10;
    
    $finish;
  end
endmodule
                              