module  shift_register_tb;
  reg clk,reset,shift_left,shift_right,s_in;
  reg [3:0] data;
  
  shift_register uut(.clk(clk),.reset(reset),.shift_left(shift_left),.shift_right(shift_right),.s_in(s_in),.data(data));
  initial begin
    forever #5 clk=~clk;
  end
  
  initial begin
    clk=0;
    reset=0;
    shift_left=0;
    shift_right=0;
    s_in=0;
    
    
    $monitor("time=%0t clk=%d reset=%d shift_left=%d shift_right=%d s_in=%d data=%b",$time,clk,reset,shift_left,shift_right,s_in,data);
    $dumpfile("shift_register.vcd");
    $dumpvars(1);
    reset=1;
    #10;
    reset=0;
    
    shift_left = 1;
    s_in = 1;
    #10;
    s_in = 0;
    #10;
    s_in = 1;
    #10;
    shift_left = 0;
    
    shift_right=1;
    s_in=1;
    #10;
    s_in=0;
    #10;
    s_in=1;
    #10;
    
    #50;
    $finish;
  end
endmodule

    
    
    
    
  