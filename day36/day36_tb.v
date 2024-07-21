module universal_binary_counter_tb;
  
  localparam n=8;
  reg [n-1:0] data;
  reg clk,reset,syn_clr,en,up,load;
  wire [n-1:0]q;
  wire min,max;
  
  universal_binary_counter dut(data,clk,reset,syn_clr,en,up,load,q,min,max);
  
  initial begin
    $monitor("time=%0t data=%b clk=%b reset=%b syn_clr=%b up=%b load=%b q=%b min=%b max=%b",$time,data,clk,reset,syn_clr,up,load,q,min,max);
    $dumpfile("universal_binary_counter.vcd");
    $dumpvars(1);
  end
  initial begin
    forever #5 clk=~clk;
  end
  
  initial begin
    clk=0;
    data=0;
    reset=1;
    syn_clr=0;
    en=0;up=0;load=0;
    #10;reset=0;//reset
    #10;load=1;data=8'b00001101;//load 13
    #10;load=0;
    #10;en=1;up=1;//upcount
    #50;
    en=0;
    #10;
    en=1;up=0;//down count
    #50;
    en=0;
    #10;
    syn_clr=1;
    #10;
    syn_clr=0;
    #10;
    load=1;data=8'b11111110;
    #10;
    load=0;
    #10;
    en=1;up=1;
    #50;
    
    
    #10;
    $finish;
  end
endmodule
    
    
    
    