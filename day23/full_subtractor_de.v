module full_subtractor(input a,b,c,output difference,bout);
  assign difference=a^b^c;
  assign bout=(~a&~b&c)|(~a&b&~c)|(a&b&c)|(~a&b&c);
endmodule
/*halfsubtractor
module hs(input a,b,ouput d,bout);
    assign diff=a^b;
    assign bout=~a&b;
endmodule
//OR(gate level)
module full_subtractor(input a,b,c,output difference,bout);
     wire y1,y2,y3,n;
     xor(y1,a,b);
     xor(sum,y1,c);
     xor(y2,b,c);
     not(n,a);
     and(n,y2);
     and(y3,b,c);
     or(n,y3);
endmodule*/