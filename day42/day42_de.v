module majority_detector(
  input a,
  input b,
  input c,
  output detected_output
);
  wire w1,w2,w3;
  and(w1,a,b);
  and(w2,b,c);
  and(w3,a,c);
  or(detected_output,w1,w2,w3);
endmodule