module half_adder(
    input a,
    input b,
    output ho,
    output co
  );
    assign ho=a^b;
    assign co=a&b;
endmodule
module full_adder(
    input a,
    input b,
    input c,
    output h1,
    output c1
  );
    assign h1=a^b^c;
    assign c1=(a&b)|(b&c)|(a&c);
endmodule
module array_multiplier(
  input [3:0]a,
  input [3:0]b,
  output [7:0]z
);
  reg signed p[4][4];
  wire [10:0]c;
  wire [5:0]s;
  
  genvar s1;
  
  generate
    for(s1=0;s1<4;s1++)
      begin:gen_and_gates
        and a0(p[s1][0], a[s1],b[0]); 
        and a1(p[s1][1], a[s1],b[1]);
        and a2(p[s1][2], a[s1],b[2]);
        and s3(p[s1][3], a[s1],b[3]);
      end
  endgenerate
  assign z[0]=p[0][0];
  
  half_adder h0(p[0][1],p[1][0],z[1],c[0]);//halfadder instantiation
  half_adder h1(p[1][1],p[2][0],s[0],c[1]);
  half_adder h2(p[3][0],p[2][1],s[1],c[2]);
    
    
  full_adder f0(p[0][2],c[0],s[0],z[2],c[3]);
  full_adder f1(p[1][2],s[1],c[1],s[2],c[4]);
  full_adder f2(p[2][2],p[3][1],c[2],s[3],c[5]);
  
  
  full_adder f3(p[0][3],c[3],s[2],z[3],c[6]);
  full_adder f4(p[1][3],s[3],c[4],s[4],c[7]);
  full_adder f5(p[3][2],c[5],p[2][3],s[5],c[8]);
  
  half_adder h4(c[6],s[4],z[4],c[9]);
  full_adder f6(c[9],c[7],s[5],z[5],c[10]);
  full_adder f7(c[10],c[8],p[3][3],z[6],z[7]);
  //n=4 halfadder are required
  //n(n-2) 8 fulladder are required
  //16 and gates are required
  
endmodule