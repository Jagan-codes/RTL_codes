module hammingdecoder_tb;
  reg [6:0]hamming_data;
  reg [3:0]data;
  wire [2:0] error_position;
  wire error;
  
  
  hammingdecoder DUT(hamming_data,data,error_position,error);
  
  initial begin
    hamming_data= 7'b0110011;
    #20;
    hamming_data= 7'b1110011;
    #20;
    hamming_data= 7'b0110111;
    
  end
    
  initial begin
    $monitor("time=%0t hamming_data=%b data=%b error_position=%b  error=%b",$time,hamming_data,data,error_position,error);
    #60;
    $finish;
    
  end
endmodule
    