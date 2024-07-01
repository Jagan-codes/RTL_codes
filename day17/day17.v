//perform both addition and subtracion based on the control signal
module fa_adder(input a,b,cin,output sum,cout);
  assign {sum,cout}={a^b^cin,((a&b)|(b&cin)|(a&cin))};
endmodule

module adder_subtractor(input [size-1:0] a,b,input crtl,output [size-1:0] sum,cout);
  parameter size=4;
  bit [size-1:0] bc;
  assign bc[0]=b[0]^crtl;
  fa_adder fa0(a[0],bc[0],crtl,sum[0],cout[0]);
  genvar i;
  generate
    for(i=1;i<size;i++)
      begin
        assign bc[i]=b[i]^crtl;
        fa_adder fa(a[i],bc[i],cout[i-1],sum[i],cout[i]);
      end
  endgenerate
endmodule

    
  
  
                     