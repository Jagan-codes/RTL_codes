module binary_encoder_tb;
  reg [7:0] d;
  wire [2:0] y;
  binary_encoder dut(.d(d),.y(y));
  initial begin
    $monitor("time=%0t d=%b y=%b ",$time,d,y);
    $dumpfile("binary_encoder");
    $dumpvars(1);
    d=8'h1;#1;
    for(integer i=0;i<8;i++)
      begin
    	d=d<<1;#1;
      end
    #8;
    $finish;

  end
endmodule
      
    