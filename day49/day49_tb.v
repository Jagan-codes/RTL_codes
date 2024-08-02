module bcd_to_7segment_b;
  reg [3:0]bcd;
  wire [6:0] seg_out;
  
  bcd_to_7segment DUT(bcd,seg_out);
    initial begin
      $monitor("time=%0t bcd=%b seg_out=%b",$time,bcd,seg_out);
      $dumpfile("bcd_to_7segment.vcd");
      $dumpvars(1);
      
      bcd=4'b0000;#10;
      bcd=4'b0001;#10;
      bcd=4'b0010;#10;
      bcd=4'b0011;#10;
      bcd=4'b0100;#10;
      bcd=4'b0101;#10;
      bcd=4'b0110;#10;
      bcd=4'b0111;#10;
      bcd=4'b1000;#10;
      bcd=4'b1001;#10;
      $finish;
    end
  endmodule
      
      