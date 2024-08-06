module restoring_division_tb;
  reg [7:0]d1;
  reg [7:0]d2;
  wire [7:0]q;
  wire [7:0]r;
  
  restoring_division DUT(d1,d2,q,r);
  initial begin
    $monitor("time=%0t d1=%b d2=%b q=%b r=%b",$time,d1,d2,q,r);
    $dumpfile("restoring_division.vcd");
    $dumpvars(1);
    
    d1=8'd100;d2=8'd10;#10;
    d1=8'd150;d2=8'd10;#10;
    d1=8'd75;d2=8'd15;#10;
    d1=8'd15;d2=8'd3;#10;
    d1=8'd75;d2=8'd10;#10;
    d1=8'd125;d2=8'd5;#10;
    d1=8'd72;d2=8'd9;#10;
    d1=8'd81;d2=8'd3;#10;
  end
endmodule