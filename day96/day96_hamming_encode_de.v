module hammingencoder(
  input [3:0]data,//transmitted data
  output [6:0]hamming_code//three parity bits to detect the position of error bit
);
  
  assign hamming_code[0]=data[0]^data[1]^data[3];//parity bit 1
  assign hamming_code[1]=data[0]^data[2]^data[3];//parity bit2
  assign hamming_code[2]=data[0];//data bit 1
  assign hamming_code[3]=data[1]^data[2]^data[3];//parity bit
  assign hamming_code[4]=data[1];//data bit 2
  assign hamming_code[5]=data[2];//data bit 3
  assign hamming_code[6]=data[3];//data bit 4
endmodule
  
  