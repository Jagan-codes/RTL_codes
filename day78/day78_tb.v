module vending_machine_tb;
  reg clk;
  reg reset;
  reg [1:0]coin;
  wire [1:0]state;
  wire dispense;
  
  vending_machine DUT(clk,reset,coin,state,dispense);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b coin=%b state=%b dispense=%b ",$time,clk,reset,coin,state,dispense);
    $dumpfile("vending_machine.vcd");
    $dumpvars(1);
    
    reset=1;
    #10;
    reset=0;
    
    coin=2'b01;#5;
    coin=2'b01;#5;
    coin=2'b01;#5;
    coin=2'b01;#5;//first dispense
    
    coin=2'b10;#5;
    coin=2'b10;#5;//second dispense
    
    coin=2'b01;#5;
    coin=2'b10;#5;
    coin=2'b01;#5;//third dispense
    
    coin=2'b10;#5;
    coin=2'b01;#5;
    coin=2'b01;#5;//fourth dispense
    
     coin=2'b01;#5;
    coin=2'b01;#5;
    coin=2'b01;#5;
    coin=2'b01;#5;//fifth dispense
    
    coin=2'b10;#5;
    coin=2'b10;#5;//six dispense
    
    coin=2'b01;#5;
    coin=2'b10;#5;
    coin=2'b01;#5;//seven dispense
    
    coin=2'b10;#5;
    coin=2'b01;#5;
    coin=2'b01;#5;//eight dispense
    
     coin=2'b00;#5;
     coin=2'b01;#5;
     coin=2'b10;#5;
     coin=2'b01;#5;
    
    
    #70;
    
    $finish;
  end
endmodule
    
/*
console output

time=5000 clk=1 reset=1 coin=xx state=00 dispense=0 
time=10000 clk=0 reset=0 coin=01 state=00 dispense=0 
time=15000 clk=1 reset=0 coin=01 state=01 dispense=0 
time=20000 clk=0 reset=0 coin=01 state=01 dispense=0 
time=25000 clk=1 reset=0 coin=01 state=10 dispense=0 
time=30000 clk=0 reset=0 coin=10 state=10 dispense=0 
time=35000 clk=1 reset=0 coin=10 state=00 dispense=1 
time=40000 clk=0 reset=0 coin=01 state=00 dispense=1 
time=45000 clk=1 reset=0 coin=10 state=10 dispense=0 
time=50000 clk=0 reset=0 coin=01 state=10 dispense=0 
time=55000 clk=1 reset=0 coin=10 state=00 dispense=1 
time=60000 clk=0 reset=0 coin=01 state=00 dispense=1 
time=65000 clk=1 reset=0 coin=01 state=01 dispense=0 
time=70000 clk=0 reset=0 coin=01 state=01 dispense=0 
time=75000 clk=1 reset=0 coin=01 state=10 dispense=0 
time=80000 clk=0 reset=0 coin=01 state=10 dispense=0 
time=85000 clk=1 reset=0 coin=01 state=11 dispense=0 
time=90000 clk=0 reset=0 coin=10 state=11 dispense=0 
time=95000 clk=1 reset=0 coin=10 state=00 dispense=1 
time=100000 clk=0 reset=0 coin=01 state=00 dispense=1 
time=105000 clk=1 reset=0 coin=10 state=10 dispense=0 
time=110000 clk=0 reset=0 coin=01 state=10 dispense=0 
time=115000 clk=1 reset=0 coin=10 state=00 dispense=1 
time=120000 clk=0 reset=0 coin=01 state=00 dispense=1 
time=125000 clk=1 reset=0 coin=01 state=01 dispense=0 
time=130000 clk=0 reset=0 coin=00 state=01 dispense=0 
time=135000 clk=1 reset=0 coin=01 state=10 dispense=0 
time=140000 clk=0 reset=0 coin=10 state=10 dispense=0 
time=145000 clk=1 reset=0 coin=01 state=11 dispense=0 
time=150000 clk=0 reset=0 coin=01 state=11 dispense=0 
time=155000 clk=1 reset=0 coin=01 state=00 dispense=1 
time=160000 clk=0 reset=0 coin=01 state=00 dispense=1 
time=165000 clk=1 reset=0 coin=01 state=01 dispense=0 
time=170000 clk=0 reset=0 coin=01 state=01 dispense=0 
time=175000 clk=1 reset=0 coin=01 state=10 dispense=0 
time=180000 clk=0 reset=0 coin=01 state=10 dispense=0 
time=185000 clk=1 reset=0 coin=01 state=11 dispense=0 
time=190000 clk=0 reset=0 coin=01 state=11 dispense=0 
time=195000 clk=1 reset=0 coin=01 state=00 dispense=1 
time=200000 clk=0 reset=0 coin=01 state=00 dispense=1 
time=205000 clk=1 reset=0 coin=01 state=01 dispense=0 
time=210000 clk=0 reset=0 coin=01 state=01 dispense=0 
time=215000 clk=1 reset=0 coin=01 state=10 dispense=0 */