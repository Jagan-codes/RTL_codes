module sequence_detector_mealy_0010_tb;
  reg clk;
  reg reset;
  reg in;
  wire out;
  
  sequence_detector_mealy_0010 DUT(clk,reset,in,out);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b in=%b out=%b",$time,clk,reset,in,out);
    $dumpfile("sequence_detector_mealy_0011.vcd");
    $dumpvars(1);
    
    reset=1;
    #10;
    reset=0;
    
    in=0;#10;
    in=0;#10;
    in=1;#10;
    in=0;#10;//sequence detected
      
    in=0;#10;
    in=1;#10;
    in=0;#10;//overlapped sequence detected
    in=1;#10;
      
    in=0;#10;
    in=0;#10;
    in=1;#10;
    in=1;#10;
      
    in=1;#10;
    in=0;#10;
    in=1;#10;
    in=1;#10;
      
    $finish;
  end
endmodule
/* console output
time=0 clk=0 reset=1 in=x out=0
time=5 clk=1 reset=1 in=x out=0
time=10 clk=0 reset=0 in=0 out=0
time=15 clk=1 reset=0 in=0 out=0
time=20 clk=0 reset=0 in=0 out=0
time=25 clk=1 reset=0 in=0 out=0
time=30 clk=0 reset=0 in=1 out=0
time=35 clk=1 reset=0 in=1 out=0
time=40 clk=0 reset=0 in=0 out=1
time=45 clk=1 reset=0 in=0 out=0
time=50 clk=0 reset=0 in=0 out=0
time=55 clk=1 reset=0 in=0 out=0
time=60 clk=0 reset=0 in=1 out=0
time=65 clk=1 reset=0 in=1 out=0
time=70 clk=0 reset=0 in=0 out=1
time=75 clk=1 reset=0 in=0 out=0
time=80 clk=0 reset=0 in=1 out=0
time=85 clk=1 reset=0 in=1 out=0
time=90 clk=0 reset=0 in=0 out=0
time=95 clk=1 reset=0 in=0 out=0
time=100 clk=0 reset=0 in=0 out=0
time=105 clk=1 reset=0 in=0 out=0
time=110 clk=0 reset=0 in=1 out=0
time=115 clk=1 reset=0 in=1 out=0
time=120 clk=0 reset=0 in=1 out=0
time=125 clk=1 reset=0 in=1 out=0
time=130 clk=0 reset=0 in=1 out=0
time=135 clk=1 reset=0 in=1 out=0
time=140 clk=0 reset=0 in=0 out=0
time=145 clk=1 reset=0 in=0 out=0
time=150 clk=0 reset=0 in=1 out=0
time=155 clk=1 reset=0 in=1 out=0
time=160 clk=0 reset=0 in=1 out=0
time=165 clk=1 reset=0 in=1 out=0*/
      
      