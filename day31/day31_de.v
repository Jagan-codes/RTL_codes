module carry_select_adder(input [3:0] a,b,input cin,output [3:0] sum,output cout);
  wire [3:0] sum0,sum1;
  wire cout0,cout1;
  wire c0,c1;
  
  add_2bit b1(.a(a[1:0]),.b(b[1:0]),.cin(1'b0),.sum(sum0[1:0]),.cout(c0));//cin=0
  add_2bit b2(.a(a[3:2]),.b(b[3:2]),.cin(1'b0),.sum(sum0[3:2]),.cout(cout0));
  add_2bit b3(.a(a[1:0]),.b(b[1:0]),.cin(1'b1),.sum(sum1[1:0]),.cout(c1));
  //cin=1 
  add_2bit b4(.a(a[3:2]),.b(b[3:2]),.cin(1'b1),.sum(sum1[3:2]),.cout(cout1));  
  
  assign sum[1:0]=cin? sum1[1:0]:sum0[1:0];
  assign sum[3:2]=cin? sum1[3:2]:sum0[3:2];
  assign cout=cin?cout1:cout0;
endmodule
module add_2bit(input [1:0] a,b,input cin,output [1:0]sum ,output cout);
  wire c1;
  fa0 a1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(c1));
  fa0 a2(.a(a[1]),.b(b[1]),.cin(c1),.sum(sum[1]),.cout(cout));
endmodule

module  fa0 (input a,b,cin,output sum,cout);
  assign sum=a^b^cin;
  assign cout=(a&b)|(a&cin)|(b&cin);
endmodule

  
           
                        
           