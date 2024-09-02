module Moore_sequence_detector_1100_tb;
  reg clk;
  reg reset;
  reg in;
  wire out;
  
  Moore_sequence_detector_1100 DUT(clk,reset,in,out);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b in=%b out=%b",$time,clk,reset,in,out);
    $dumpfile("Moore_sequence_detector_1100.vcd");
    $dumpvars(1);
    reset=1;
    #10;
    reset=0;
    in=1;#10;
    in=1;#10;
    in=0;#10;
    in=0;#10; //sequence detected
    
    in=0;#10;
    in=1;#10;
    in=1;#10;
    in=0;#10;
    
    in=1;#10;
    in=1;#10;
    in=0;#10;
    in=1;#10;
    
    in=0;#10;
    in=1;#10;
    in=0;#10;
    in=1;#10;
    
    $finish;
  end
endmodule
    
    