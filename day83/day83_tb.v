module gray_counter_tb;
  reg clk;
  reg reset;
  wire [3:0]gray_count;
  
  gray_counter DUT(clk,reset,gray_count);
  always begin
    #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b gray_count=%b",$time,clk,reset,gray_count);
    $dumpfile("gray_counter.vcd");
    $dumpvars(1);
    
    clk=0;
    reset=1;
    #10;
    reset=0;
    #150;
    $finish;
  end
endmodule
  /*
  console output
  time=0 clk=0 reset=1 gray_count=0000
time=5 clk=1 reset=1 gray_count=0000
time=10 clk=0 reset=0 gray_count=0000
time=15 clk=1 reset=0 gray_count=0000
time=20 clk=0 reset=0 gray_count=0000
time=25 clk=1 reset=0 gray_count=0001
time=30 clk=0 reset=0 gray_count=0001
time=35 clk=1 reset=0 gray_count=0011
time=40 clk=0 reset=0 gray_count=0011
time=45 clk=1 reset=0 gray_count=0010
time=50 clk=0 reset=0 gray_count=0010
time=55 clk=1 reset=0 gray_count=0110
time=60 clk=0 reset=0 gray_count=0110
time=65 clk=1 reset=0 gray_count=0111
time=70 clk=0 reset=0 gray_count=0111
time=75 clk=1 reset=0 gray_count=0101
time=80 clk=0 reset=0 gray_count=0101
time=85 clk=1 reset=0 gray_count=0100
time=90 clk=0 reset=0 gray_count=0100
time=95 clk=1 reset=0 gray_count=1100
time=100 clk=0 reset=0 gray_count=1100
time=105 clk=1 reset=0 gray_count=1101
time=110 clk=0 reset=0 gray_count=1101
time=115 clk=1 reset=0 gray_count=1111
time=120 clk=0 reset=0 gray_count=1111
time=125 clk=1 reset=0 gray_count=1110
time=130 clk=0 reset=0 gray_count=1110
time=135 clk=1 reset=0 gray_count=1010
time=140 clk=0 reset=0 gray_count=1010
time=145 clk=1 reset=0 gray_count=1011
time=150 clk=0 reset=0 gray_count=1011
time=155 clk=1 reset=0 gray_count=1001*/