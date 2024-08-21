module bcd_to_excess_3converter_tb;
  reg [3:0] in;
  wire [3:0]out;
  wire valid;
  wire error;
  
  bcd_to_excess_3converter DUT(in,out,valid,error);
  initial begin
    $monitor("time=%0t in=%b out=%b valid=%b error=%b",$time,in,out,valid,error);
    $dumpfile("bcd_to_excess_3converter.vcd");
    $dumpvars(1);
    
    in=4'b0000;#10;
    in=4'b0001;#10;
    in=4'b0010;#10;
    in=4'b0011;#10;
    in=4'b0100;#10;
    in=4'b0101;#10;
    in=4'b0110;#10;
    in=4'b0111;#10;
    in=4'b1000;#10;
    in=4'b1001;#10;
    in=4'b1010;#10;
    in=4'b1111;#10;
    in=4'b1011;#10;
    $finish;
  end
endmodule
  