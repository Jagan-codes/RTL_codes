module carry_look_ahead_adder(input [3:0] a,b,input cin,output [3:0] sum,output cout);
  wire [3:0] g,p,c;//generate and propagate signals
  assign g=a&b;
  assign p=a^b;
  assign c[0]=cin;
  assign c[1]=g[0]|(p[0]&cin);
  assign c[2]=g[1]|(p[1]&g[0])|(p[1]&p[0]&cin);
  assign c[3]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin);


    
    
  assign cout=g[3]|(p[3]&c[3]);
  
  assign sum=p^c;
endmodule
          

