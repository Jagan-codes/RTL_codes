module one_hot_fsm_tb;
  reg clk,reset;
  wire [3:0]state;
  wire [1:0]out;
  localparam [3:0] IDLE=4'b0001,
                  STATE1=4'b0010,
                  STATE2=4'b0100,
                  STATE3=4'b1000;
  
  one_hot_fsm DUT(clk,reset,state,out);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b state%b out=%b",$time,clk,reset,state,out);
    $dumpfile("one_hot_fsm.vcd");
    $dumpvars(1);
    
    reset=1;
    #10;
    reset=0;
    #100;
    reset=0;
    $finish;
  end
endmodule