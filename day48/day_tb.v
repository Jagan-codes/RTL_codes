module Simple_register_tb;
  localparam n=4;
  reg clk;
  reg [n-1:0]d;
  wire [n-1:0]q;
  
  Simple_register DUT(clk,d,q);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b d=%b q=%b",$time,clk,d,q);
    $dumpfile("Simple_register.vcd");
    $dumpvars(1);
   
    for(integer v=0;v<16;v=v+1)
      begin
        d=v;
        #10;
      end
    #10;
    $finish;
  end
endmodule
        
   