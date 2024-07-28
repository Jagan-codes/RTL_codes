module minority_detector_tb;
  reg a;
  reg b;
  reg c;
  wire detected_output;
  
  minority_detector DUT(a,b,c,detected_output);
  initial begin
    $monitor("time=%0t a=%b b=%b c=%b",$time,a,b,c);
    $dumpfile("minority_detector.vcd");
    $dumpvars(1);
    
    a=0;b=0;c=0;#10;
    a=0;b=0;c=1;#10;
    a=0;b=1;c=0;#10;
    a=0;b=1;c=1;#10;
    a=1;b=0;c=0;#10;
    a=1;b=0;c=1;#10;
    a=1;b=1;c=0;#10;
    a=1;b=1;c=1;#10;
    
    $finish;
  end
endmodule