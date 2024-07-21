module dlatch(input clk,d,output q,q_bar);
  wire mux_out;
  
  assign q=mux_out;
  assign q_bar=~mux_out;
  
  mux2_1 m1(.in0(q),.in1(d),.sel(clk),.out(mux_out));
endmodule
module mux2_1(input in0a,in1,sel,output out);
  assign out=sel?in1:in0;
endmodule