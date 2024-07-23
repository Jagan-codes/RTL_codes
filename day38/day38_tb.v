module PISO_shift_reg_tb;
  reg clk;
  reg reset;
  reg load;
  reg [7:0] d;
  wire q;
  
  PISO_shift_reg dut(clk,reset,load,d,q);
  initial begin
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b load=%b d=%b q=%b",$time,clk,reset,load,d,q);
    $dumpfile("PISO_shift_reg.vcd");
    $dumpvars(1);
    
    clk=0;
    reset=1;
    load=0;
    #10;
    reset=0;
    load=1;
    d=8'ha_a;
    #10;
    load=0;
    #30;
    load=1;
    d=8'hb_b;
    #40;
    load=0;
    $finish;
  end
endmodule
  
  
  