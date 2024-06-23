//design
//gate level modeling 
module fadder(input a,b,cin,output sum ,cout);
  wire w1,w2,w3;
  xor(w1,a,b);
  xor(sum,w1,cin);
  and(w2,a,b);
  and(w3,w1,cin);
  or(cout,w2,w3);
endmodule

module ripple_carry_adder(input [3:0] a,b,input cin,output [3:0] sum,output cout);
  wire c1,c2,c3;
  fadder f0(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(c1));
  fadder f1(.a(a[1]),.b(b[1]),.cin(c1),.sum(sum[1]),.cout(c2));
  fadder f2(.a(a[2]),.b(b[2]),.cin(c2),.sum(sum[2]),.cout(c3));
  fadder f3(.a(a[3]),.b(b[3]),.cin(c3),.sum(sum[3]),.cout(cout));
endmodule
  //testbench
  module ripple_carry_adder_tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0] sum;
  wire cout;
  
  ripple_carry_adder uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
  initial begin
    a=4'b1001;b=4'b1100;cin=0;
    #10;
    $monitor("time=%0t a=%b b=%b cin=%d sum =%b cout=%b",$time,a,b,cin,sum,cout);
    $dumpfile("dump.vcd");
    $dumpvars(1);
    a=4'b1111;b=4'b1111;cin=0;
    #10;
    a=4'b1010;b=4'b1010;cin=1;
    #10;
    a=4'b1100;b=4'b1100;cin=1;
    $finish;
  end
endmodule
    