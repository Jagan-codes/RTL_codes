module priority_encoder_tb;
  reg [0:7] d;
  wire [0:2]y;
  
  priority_encoder dut(.d(d),.y(y));
  initial begin
    $monitor("time=%0t d=%b y=%b",$time,d,y);
    $dumpfile("priority_encoder.vcd");
    $dumpvars(1);
    repeat(10)
      begin
        d=$random;#1;
      end
  end
endmodule