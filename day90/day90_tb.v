module ATM_FSM_tb;
  reg clk;
  reg reset;
  reg card_in;
  reg [3:0] entered_pin;
  reg balance_req;
  reg withdraw_req;
  reg deposit_req;
  reg [7:0]amount;
  wire [8:0]curr_balance;
  wire transaction_completed;
  wire pin_correct;
  wire [2:0]state;
  
  ATM_FSM DUT(clk,reset,card_in,entered_pin,balance_req,withdraw_req,deposit_req,amount,curr_balance,transaction_completed,pin_correct,state);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b card_in=%b entered_pin=%b balance_req=%b withdraw_req=%b deposit_req=%b amount=%b curr_balance=%b  transaction_completed=%b pin_correct=%b state=%b",$time,clk,reset,card_in,entered_pin,balance_req,withdraw_req,deposit_req,amount,curr_balance,transaction_completed,pin_correct,state);
    $dumpfile("ATM_FSM.vcd");
    $dumpvars(1);
    
    reset=1;
    card_in=0;
    entered_pin=4'd0;
    balance_req=0;
    withdraw_req=0;
    deposit_req=0;
    amount=8'd0;
    #10;
    
    reset=0;
    card_in=1;
    entered_pin=4'b1111;//deposit
    deposit_req=1;
    balance_req=0;
    withdraw_req=0;
    amount=8'b11111111;
    
    #80;
    deposit_req=0;
    card_in=1;
    entered_pin=4'b1111;//BALANCE checking
    balance_req=1;
    withdraw_req=0;
    deposit_req=0;
    
    
    
    #80;
    card_in=1;
    entered_pin=4'b1111;//deposit
    withdraw_req=1;
    deposit_req=0;
    balance_req=0;
    amount=8'b00110011;
    
    #80;
    $finish;
  end;
endmodule
    
    
/* console output
time=0 clk=0 reset=1 card_in=0 entered_pin=0000 balance_req=0 withdraw_req=0 deposit_req=0 amount=00000000 curr_balance=000000100  transaction_completed=0 pin_correct=0 state=000
time=5 clk=1 reset=1 card_in=0 entered_pin=0000 balance_req=0 withdraw_req=0 deposit_req=0 amount=00000000 curr_balance=000000100  transaction_completed=0 pin_correct=0 state=000
time=10 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=000000100  transaction_completed=0 pin_correct=0 state=000
time=15 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=000000100  transaction_completed=0 pin_correct=0 state=001
time=20 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=000000100  transaction_completed=0 pin_correct=0 state=001
time=25 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=000000100  transaction_completed=0 pin_correct=0 state=010
time=30 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=000000100  transaction_completed=0 pin_correct=0 state=010
time=35 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=000000100  transaction_completed=0 pin_correct=1 state=011
time=40 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=000000100  transaction_completed=0 pin_correct=1 state=011
time=45 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=000000100  transaction_completed=0 pin_correct=1 state=110
time=50 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=000000100  transaction_completed=0 pin_correct=1 state=110
time=55 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=111
time=60 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=111
time=65 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=100000011  transaction_completed=1 pin_correct=1 state=000
time=70 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=100000011  transaction_completed=1 pin_correct=1 state=000
time=75 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=001
time=80 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=001
time=85 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=0 deposit_req=1 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=010
time=90 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=010
time=95 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=011
time=100 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=011
time=105 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=100
time=110 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=100
time=115 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=011
time=120 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=011
time=125 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=100
time=130 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=100
time=135 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=011
time=140 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=011
time=145 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=100
time=150 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=100
time=155 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=011
time=160 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=011
time=165 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=1 withdraw_req=0 deposit_req=0 amount=11111111 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=100
time=170 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=1 deposit_req=0 amount=00110011 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=100
time=175 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=1 deposit_req=0 amount=00110011 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=011
time=180 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=1 deposit_req=0 amount=00110011 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=011
time=185 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=1 deposit_req=0 amount=00110011 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=101
time=190 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=1 deposit_req=0 amount=00110011 curr_balance=100000011  transaction_completed=0 pin_correct=1 state=101
time=195 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=1 deposit_req=0 amount=00110011 curr_balance=011010000  transaction_completed=0 pin_correct=1 state=111
time=200 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=1 deposit_req=0 amount=00110011 curr_balance=011010000  transaction_completed=0 pin_correct=1 state=111
time=205 clk=1 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=1 deposit_req=0 amount=00110011 curr_balance=011010000  transaction_completed=1 pin_correct=1 state=000
time=210 clk=0 reset=0 card_in=1 entered_pin=1111 balance_req=0 withdraw_req=1 deposit_req=0 amount=00110011 curr_balance=011010000  transaction_completed=1 pin_correct=1 state=000
*/