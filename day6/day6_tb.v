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