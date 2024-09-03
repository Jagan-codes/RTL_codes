module sequence_detector_overlapping_tb;
  reg clk;
  reg reset;
  reg in;
  wire out;
  
  sequence_detector_overlapping DUT(clk,reset,in,out);
  always begin
    #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b in=%b out=%b",$time,clk,reset,in,out);
    $dumpfile("sequence_detector_overlapping.vcd");
    $dumpvars(1);
    clk=0;
    reset=1;
    #10;
    reset=0;
    #10;
    in=0;#10;
    in=1;#10;
    in=0;#10;
    in=1;#10;
    //sequence detected
    
    in=0;#10;
    in=1;#10;//overlapping sequence
    in=0;#10;
    in=1;#10;//overlapping sequence
    
    in=1;#10;
    in=1;#10;
    in=1;#10;
    in=1;#10;
    
    in=0;#10;
    in=1;#10;
    in=1;#10;
    in=1;#10;
    
    in=0;#10;
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

    
    