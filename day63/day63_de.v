module full_adder(
  input a,
  input b,
  input c,
  output sum,carry);
  assign sum=a^b^c;
  assign carry=(a&b)|(b&c)|(a&c);
endmodule

module parallel_adder(
  input [3:0] a,b,
  input c,
  output [3:0]sum,
  output carry
);
  wire [2:0]c1;
  full_adder p1(a[0],b[0],c,sum[0],c1[0]);
  full_adder p2(a[1],b[1],c1[0],sum[1],c1[1]);
  full_adder p3(a[2],b[2],c1[1],sum[2],c1[2]);
  full_adder p4(a[3],b[3],c1[2],sum[3],carry);
  
endmodule
  
  
module carry_skip_adder(
  input [3:0]a,b,
  input cin,
  output [3:0]sum,
  output carry
);
  wire sel,c;
  wire [3:0]p;
  
  parallel_adder pi(a,b,cin,sum,carry);
  
  xor(p[0],a[0],b[0]),
  (p[1],a[1],b[1]),
  (p[2],a[2],b[2]),
  (p[3],a[3],b[3]);
  
  and(sel,p[0],p[1],p[2],p[3]);
  
  assign carry=sel?cin:c;
endmodule