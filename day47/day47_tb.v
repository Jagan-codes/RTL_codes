module clock_Buffer_tb;
  reg clk_in;
  wire clk_out;
 
  clock_Buffer DUT(clk_in,clk_out);
  initial begin
    forever #5 clk_in=~clk_in;
  end
  initial begin
    $monitor("time=%0t clk_in=%b clk_out=%b",$time,clk_in,clk_out);
    $dumpfile("clock_Buffer.vcd");
    $dumpvars(1);
    
    clk_in=0;
    
    #100;
    $finish;
    
  end
endmodule
  

    
  
    
      
  
  