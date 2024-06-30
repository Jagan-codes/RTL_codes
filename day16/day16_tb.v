module carry_look_ahead_adder_tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0] sum;
  wire cout;
  wire [4:0] add;
  
  carry_look_ahead_adder uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
  assign add={cout,sum};
  initial begin
    $monitor("time=%0t a=%d b=%d cin=%d sum=%b cout=%b add=%d",$time,a,b,cin,sum,cout,add);
    $dumpfile("carry_look_ahead_adder");
    $dumpvars(1);
    
    //intialize
    a=4'b1000;b=4'b1000;cin=1;#5;
    a=4'b1000;b=4'b1000;cin=0;#5;
    a=4'b1001;b=4'b1011;cin=1;#5;
    a=4'b0011;b=4'b1000;cin=1;#5;
    a=4'b0101;b=4'b1001;cin=0;#5;
    a=4'b0011;b=4'b0010;cin=1;#5;
    a=4'b0010;b=4'b1111;cin=1;#5;
     
    
    $finish;
  end 
  always #2.5 a=a+1;
endmodule
    
    