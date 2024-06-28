//design 
module v_oper(input [3:0]a,b,output [4:0]sum,diff,output [7:0]prod,output eq,gt,lt, and_res,or_res,parity, output [3:0]rs,ls ,bit_and,bit_or,bit_xor,bit_not);
  assign sum=a+b;
  assign diff=a-b;
  assign prod=a*b;
  assign eq=(a==b);
  assign gt=(a>b);
  assign lt=(a<b);
  assign and_res=a&&b;
  assign or_res=a||b;
  assign parity=^a;
  assign rs=a>>1;
  assign ls=a<<1;
  assign bit_and=a&b;
  assign bit_or=a|b;
  assign bit_xor=a^b;
  assign bit_not=~a;
endmodule

             
             
            
  
  