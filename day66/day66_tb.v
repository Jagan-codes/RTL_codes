module bcd_to_binary_tb;
  reg [11:0]bcd;
  wire [7:0]binary;
  
  bcd_to_binary DUT(bcd,binary);
  initial begin
    $monitor("$time=%0t bcd=%b binary=%b",$time,bcd,binary);
    $dumpfile("bcd_to_binary.vcd");
    $dumpvars(1);
    
    
    bcd=12'b0000_0110_1100;#10;
    bcd=12'b0001_0011_0010;#10;
    bcd=12'b0010_0011_0010;#10;
    bcd=12'b0100_0001_0001;#10;
    bcd=12'b1000_0111_0011;#10;
    bcd=12'b0110_0011_1110;#10;
    bcd=12'b0011_1100_0110;#10;
    bcd=12'b1010_0110_0101;#10;
    bcd=12'b1100_0101_0011;#10;
    bcd=12'b0110_1100_0010;#10;
    #10;
  end
endmodule