//design
module mux2_1(input sel,i1,i0,output y);
  assign y=sel?i1:i0;
endmodule

