module adder_subtractor_tb;
  reg [3:0] a,b;
  reg crtl;
  wire [3:0] sum,cout;
  
  adder_subtractor dut(.a(a),.b(b),.crtl(crtl),.sum(sum),.cout(cout));
  initial begin
    $monitor("time=%0t a=%b b=%b crtl=%b sum=%b cout=%b",$time,a,b,crtl,sum,cout[3]);
    $dumpfile("adder_subtractor.vcd");
    $dumpvars(1);
    
    crtl=0;
    a=1;b=0;
    #3;
    a=2;b=4;
    #3;
    a=4'hb;b=4'h6;
    #3;
    a=5;b=3;
    #5;
    crtl=1;
    a=1;b=0;
    #3;
    a=2;b=4;
    #3;
    a=4'hb;b=4'h6;
    #3;
    a=5;b=3;
    #5;
    $finish;
  end
endmodule
    