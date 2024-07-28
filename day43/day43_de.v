module minority_detector(
  input a,
  input b,
  input c,//inputs
  output detected_output);//output
  
  wire w1,w2,w3;
  assign w1=a&b;
  assign w2=a&c;
  assign w3=b&c;
  
  assign detected_output=~(w1|w2|w3);
endmodule