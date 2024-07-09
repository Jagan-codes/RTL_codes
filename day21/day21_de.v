module fa(input a,b,cin,output  sum,cout);
  assign sum=a^b^cin;
  assign cout=(a&b)|(b&cin)|(a&cin);
endmodule

module Ripple_Carry_adder(input [size-1:0] a,b,input cin,output [size-1:0] sum,cout);
  parameter size=4;
  fa f0(a[0],b[0],cin,sum[0],cout[0]);
  genvar i;
  generate 
    for(i=1;i<size;i++)
      begin
        fa ins(a[i],b[i],cout[i-1],sum[i],cout[i]);
      end
  endgenerate
endmodule