module hammingdecoder(
  input [6:0]hamming_data,//hamming encoded data data
  input [3:0] data,
  output [2:0]error_position,
  output error//indicate there is error or not
);
  
  wire w1,w2,w3;
  assign data[0]=hamming_data[2];
  assign data[1]=hamming_data[4];
  assign data[2]=hamming_data[5];
  assign data[3]=hamming_data[6];
  
  assign w1=hamming_data[0]^hamming_data[2]^hamming_data[4]^hamming_data[6];
  assign w2=hamming_data[1]^hamming_data[2]^hamming_data[5]^hamming_data[6];
  assign w2=hamming_data[3]^hamming_data[4]^hamming_data[5]^hamming_data[6];
  
  assign error_position={w1,w2,w3};
  assign error=w1|w2|w3;
  
endmodule
  
  