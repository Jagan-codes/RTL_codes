module binary_bcd_tb;
  reg [7:0]binary;
  wire [11:0]bcd;
  
  binary_bcd DUT(binary,bcd);
  initial begin
    $monitor("time=%0t binary=%b bcd=%b",$time,binary,bcd);
    $dumpfile("binary_bcd.vcd");
    $dumpvars(1);
    
    binary=8'b10101010;#10;
    binary=8'b01010101;#10;
    binary=8'b11110000;#10;
    binary=8'b00001111;#10;
    binary=8'b11001100;#10;
    binary=8'b00110011;#10;
    binary=8'b10110110;#10;
    binary=8'b00001100;#10;
    $finish;
  end
endmodule
    