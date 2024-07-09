module Ripple_Carry_adder_tb;
  parameter size=4;
  reg [size-1:0] a,b;
  reg cin;
  wire [size-1:0] sum,cout;
  wire [4:0] add;
  
  
  Ripple_Carry_adder dut(a,b,cin,sum,cout);
  assign add={cout[3],sum};
  initial begin
    $monitor("time=%0t a=%b b=%b cin=%b sum=%b cout=%b addition=%d ",$time,a,b,cin,sum,cout[3],add);
    $dumpfile("Ripple_Carry_adder.vcd");
    $dumpvars(1);
    
    a=4'hb;
    b=4'hf;
    cin=1;
    #10;
    a=4'h7;
    b=4'h8;
    cin=1;
    #10;
    a=4'h9;
    b=4'ha;
    cin=1;
    #10;
     a=4'h5;
    b=4'h5;
    cin=1;
    #10;
    $finish;
  end
endmodule