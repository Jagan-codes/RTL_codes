module carry_select_adder_tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0] sum;
  wire cout;
  
  carry_select_adder dut(a,b,cin,sum,cout);
  initial begin
    $monitor("time=%0t a=%b b=%b cin=%b sum=%b cout=%b",$time,a,b,cin,sum,cout);
    $dumpfile("carry_select_adder.vcd");
    $dumpvars(1);
    
    a=4'b0000;
    b=4'b0000;
    cin=0;
    #10;
    a=4'b1001;
    b=4'b1010;
    cin=1;
    #10;
    a=4'b1100;
    b=4'b0011;
    cin=0;
    #10;
    a=4'b1001;
    b=4'b0110;
    #10
    a=4'b1111;
    b=4'b0111;
    #10
    $finish;
  end
endmodule