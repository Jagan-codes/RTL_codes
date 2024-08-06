module ha(
  input a,b,
  output s,c);
  assign s=a^b;
  assign c=a&b;
endmodule
module fa(
  input a,b,c,
  output s,ca
);
  assign s=a^b^c;
  assign ca=(a&b)|(b&c)|(a&c);
endmodule
module wallace_Tree_multiplier(
  input [3:0]a,b,
  output [7:0]y);
  
  reg signed p[8][4];
  wire [17:0]c;
  wire [10:0]s;
  genvar g;
  wire signed [7:0]m;
  assign {m[7:4],m[3:0]}={{4{a[3]}},a};
  generate
    for(g=0;g<4;g=g+1)
      begin:gen_and
        and a0(p[g][0],m[g],b[0]);
        and a1(p[g][1],m[g],b[1]);
        and a2(p[g][2],m[g],b[2]);
        and a3(p[g][3],m[g],b[3]);
      end
  endgenerate
  generate
    for(g=0;g<4;g=g+1)
	   begin :gen_2
			and a4(p[4][g],m[4],b[g]);
		end
    for(g=0;g<3;g=g+1)
	   begin :gen_1 
			and a5(p[5][g],m[5],b[g]);
		end
    for(g=0;g<2;g=g+1) 
	   begin:gen_3
			and a6(p[6][g],m[6],b[g]);
		end
  endgenerate
  and a7(p[7][0],m[7],b[0]);
    
  assign y[0]=p[0][0];
  
  ha h0(p[0][2],p[1][1],s[0],c[0]);
  
  generate
    for(g=0;g<5;g=g+1)
	   begin:gen_4
			fa fg1(p[g][3],p[g+1][2],p[g+2][1],s[g+1],c[g+1]);
		end
  endgenerate
  
  ha h1(s[1],p[3][0],s[6],c[6]);
  
  generate
    for(g=0;g<4;g=g+1)
	   begin : gen_5
			fa fg1(s[g+2],p[g+4][0],c[g+1],s[g+7],c[g+7]);
		end
  endgenerate
  ha h2(p[0][1],p[1][0],y[1],c[11]);
  fa f9(s[0],p[2][0],c[11],y[2],c[12]);
  fa f10(s[6],c[12],c[0],y[3],c[13]);
  
  generate
    for(g=0;g<4;g=g+1)
	   begin:gen_6
			fa fg2(s[g+7],c[g+6],c[g+13],y[g+4],c[g+14]);
		end
  endgenerate
endmodule
  
  