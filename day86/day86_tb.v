module password_lock_fsm_tb;
  reg clk;
  reg reset;
  reg [3:0]digit;
  reg enter;
  wire unlock;
  
  password_lock_fsm  DUT(clk,reset,digit,enter,unlock);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b digit =%b enter=%b unlock=%b ",$time,clk,reset,digit,enter,unlock);
    $dumpfile("password_lock_fsm.vcd");
    $dumpvars(1);
    
    reset=0;
    digit=0;
    enter=0;
    #10;
    
    reset=1;
    #10;
    
    reset=0;
    
    enter =1;
    digit=4'd7;#10;
    enter=0;#10;
    digit=4'd7;#10;
    digit=4'd7;#10;
    digit=4'd7;
    enter=1;
    #10;
    enter=0;
    #10;
    
    enter=1;
    digit=4'd5;#10;
    enter=0;#10;
    digit=4'd7;#10;
    digit=4'd0;#10;
    digit=4'd2;
    enter=1;
    enter=0;
    #10;
    
    enter =1;
    digit=4'd7;#10;
    enter=0;#10;
    digit=4'd7;#10;
    digit=4'd7;#10;
    digit=4'd7;
    enter=1;#10;
    
    $finish;
  end
endmodule
/*console output
time=0 clk=0 reset=0 digit =0000 enter=0 unlock=0 
time=5 clk=1 reset=0 digit =0000 enter=0 unlock=0 
time=10 clk=0 reset=1 digit =0000 enter=0 unlock=0 
time=15 clk=1 reset=1 digit =0000 enter=0 unlock=0 
time=20 clk=0 reset=0 digit =0111 enter=1 unlock=0 
time=25 clk=1 reset=0 digit =0111 enter=1 unlock=0 
time=30 clk=0 reset=0 digit =0111 enter=0 unlock=0 
time=35 clk=1 reset=0 digit =0111 enter=0 unlock=0 
time=40 clk=0 reset=0 digit =0111 enter=0 unlock=0 
time=45 clk=1 reset=0 digit =0111 enter=0 unlock=0 
time=50 clk=0 reset=0 digit =0111 enter=0 unlock=0 
time=55 clk=1 reset=0 digit =0111 enter=0 unlock=0 
time=60 clk=0 reset=0 digit =0111 enter=1 unlock=1 
time=65 clk=1 reset=0 digit =0111 enter=1 unlock=0 
time=70 clk=0 reset=0 digit =0111 enter=0 unlock=0 
time=75 clk=1 reset=0 digit =0111 enter=0 unlock=0 
time=80 clk=0 reset=0 digit =0101 enter=1 unlock=0 
time=85 clk=1 reset=0 digit =0101 enter=1 unlock=0 
time=90 clk=0 reset=0 digit =0101 enter=0 unlock=0 
time=95 clk=1 reset=0 digit =0101 enter=0 unlock=0 
time=100 clk=0 reset=0 digit =0111 enter=0 unlock=0 
time=105 clk=1 reset=0 digit =0111 enter=0 unlock=0 
time=110 clk=0 reset=0 digit =0000 enter=0 unlock=0 
time=115 clk=1 reset=0 digit =0000 enter=0 unlock=0 
time=120 clk=0 reset=0 digit =0010 enter=0 unlock=0 
time=125 clk=1 reset=0 digit =0010 enter=0 unlock=0 
time=130 clk=0 reset=0 digit =0111 enter=1 unlock=0 
time=135 clk=1 reset=0 digit =0111 enter=1 unlock=0 
time=140 clk=0 reset=0 digit =0111 enter=0 unlock=0 
time=145 clk=1 reset=0 digit =0111 enter=0 unlock=0 
time=150 clk=0 reset=0 digit =0111 enter=0 unlock=0 
time=155 clk=1 reset=0 digit =0111 enter=0 unlock=0 
time=160 clk=0 reset=0 digit =0111 enter=0 unlock=0 
time=165 clk=1 reset=0 digit =0111 enter=0 unlock=0 
time=170 clk=0 reset=0 digit =0111 enter=1 unlock=1 
time=175 clk=1 reset=0 digit =0111 enter=1 unlock=0*/
