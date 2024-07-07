module fulladder(input a,b,cin,output sum,carry);
  assign sum=a^b^cin;
  assign carry=(a&b)|(b&cin)|(a&cin);
endmodule
/*half adder
module ha(input a,b, output sum,carry);
  assign sum=a^b;
  assign carry=a&b;
endmodule
//OR(gatemodeling)
module fa(input a,b,cin,output sum,carry);
   wire y1,y2,y3,y4;
   xor(y1,a,b);
   xor(sum,y1,cin);
   and(y3,a,b);
   and(y4,y3,cin);
   or(cout,y3,y4);*/

