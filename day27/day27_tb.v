module universal_shift_register_tb;
  reg [1:0]select;
  reg clk,reset;
  reg l_in,r_in;
  reg [3:0] pdin;
  wire [3:0] pdout;
  wire l_s_out,r_s_out;
  
  universal_shift_register dut(clk,reset,select,pdin,l_in,r_in,pdout,l_s_out,r_s_out);
  initial begin
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%ot clk=%b reset=%b select=%b pdin=%b l_in=%b r_in=%b pdout=%b l_d_out=%b r_s_out=%b",$time,clk,reset,select,pdin,l_in,r_in,pdout,l_s_out,r_s_out);
    $dumpfile("universal_shift_register.vcd");
    $dumpvars(1);
    clk=1;reset=1;
    #5;
    reset=0;
    #5;
    
    pdin=4'b1111;
    l_in=1'b0;
    r_in=1'b1;
    select=2'h2;#10;
    select=2'h1;#10;
    select=2'h0;#10;
    
    pdin=4'b1100;
    l_in=1'b1;
    r_in=1'b0;
    select=2'h1;#10;
    select=2'h2;#10;
    select=2'h0;
    
    $finish;
  end
endmodule
    
    
    