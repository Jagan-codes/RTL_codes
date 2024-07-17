module binary_to_one_hot_encoder_tb;
  localparam m=4;
  localparam n=16;
  reg [m-1:0] bin;
  wire [n-1:0] onehotout;
  
  binary_to_one_hot_encoder dut(onehotout,bin);
  
  initial begin
    integer i;
    for(i=0;i<16;i=i+1)
      begin
      	bin=i;
    	#10;
      end
  end
  initial begin
    $monitor("time=%0t bin=%b onehotout=%b",$time,bin,onehotout);
    $dumpfile("binary_to_one-hot_encoder.vcd");
    $dumpvars(1);
    
    #200;
    $finish;
  end
endmodule
  