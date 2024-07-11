module decoder_tb;
  reg [2:0] j;
  wire [7:0] y;
  
  decoder dut(.j(j),.y(y));
  initial begin
    $monitor("time=%0t j=%b y=%b",$time,j,y);
    $dumpfile("decoder.vcd");
    $dumpvars(1);
    
    repeat(20)
      begin
        j=$random;#1;
      end
  end
endmodule