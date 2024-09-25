module hammingencoder_tb;
  reg [3:0]data;
  wire [6:0]hamming_code;
  
  hammingencoder DUT(data,hamming_code);
  
  initial begin
    data=4'b0110;
    #2 $display("time=%0t data=%b hamming code=%b",$time,data,hamming_code);
    #10;
    $finish;
  end
endmodule
    