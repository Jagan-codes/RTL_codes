module booth_multiplier_tb;
  reg signed [7:0] m1;
  reg signed [7:0] m2;
  wire signed [15:0] product;

  booth_multiplier DUT(m1, m2, product);

  initial begin
    $monitor("time=%0t m1=%b m2=%b product=%d", $time, m1, m2, product);
    $dumpfile("booth_multiplier.vcd");
    $dumpvars(1);

    m1=8'd10;m2=8'd5;
    #10;
    m1=-8'd10;m2=-8'd5;
    #10;
    m1=8'd10;m2=-8'd5;
    #10;
    m1=-8'd15;m2=8'd15;
    #10;
    m1=-8'd20;m2=-8'd25;
    #10;
    m1=-8'd25;m2=8'd25;
    #10;

    m1=-8'd15;m2=-8'd16;
    #10;

    m1=8'd14;m2=8'd14;
    #10;

    $finish;
  end
endmodule
