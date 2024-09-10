module credit_card_fsm_tb;
  reg clk;
  reg reset;
  reg swipe_card;
  reg valid_data;
  reg sufficient_fund;
  wire transaction_status;
  
  
  credit_card_fsm DUT(clk,reset,swipe_card,valid_data,sufficient_fund,transaction_status);
  always begin
    #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b swipe_card=%b valid_data=%b sufficient_fund=%b transaction_status=%b",$time,clk,reset,swipe_card,valid_data,sufficient_fund,transaction_status);
    $dumpfile("credit_card_fsm.vcd");
    $dumpvars(1);
    
    clk=0;
    reset=1;
    swipe_card=0;
    valid_data=0;
    sufficient_fund=0;
    #10;
    reset=0;
    swipe_card=1;
    valid_data=1;
    sufficient_fund=1;
    #10;
    
    swipe_card=1;
    valid_data=0;
    sufficient_fund=0;
    #10;
    swipe_card=1;
    valid_data=1;
    sufficient_fund=0;
    #10;
    swipe_card=1;
    valid_data=1;
    sufficient_fund=1;
    #10;
    $finish;
  end
endmodule
  /* console output 
  time=0 clk=0 reset=1 swipe_card=0 valid_data=0 sufficient_fund=0 transaction_status=0
time=5 clk=1 reset=1 swipe_card=0 valid_data=0 sufficient_fund=0 transaction_status=0
time=10 clk=0 reset=0 swipe_card=1 valid_data=1 sufficient_fund=1 transaction_status=0
time=15 clk=1 reset=0 swipe_card=1 valid_data=1 sufficient_fund=1 transaction_status=0
time=20 clk=0 reset=0 swipe_card=1 valid_data=0 sufficient_fund=0 transaction_status=0
time=25 clk=1 reset=0 swipe_card=1 valid_data=0 sufficient_fund=0 transaction_status=0
time=30 clk=0 reset=0 swipe_card=1 valid_data=1 sufficient_fund=0 transaction_status=0
time=35 clk=1 reset=0 swipe_card=1 valid_data=1 sufficient_fund=0 transaction_status=0
time=40 clk=0 reset=0 swipe_card=1 valid_data=1 sufficient_fund=1 transaction_status=0
time=45 clk=1 reset=0 swipe_card=1 valid_data=1 sufficient_fund=1 transaction_status=1
testbench.sv:44: $finish called at 50 (1s)
time=50 clk=0 reset=0 swipe_card=1 valid_data=1 sufficient_fund=1 transaction_status=1*/