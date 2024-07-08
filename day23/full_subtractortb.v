module full_subtractor_tb;
  reg a,b,c;
  wire difference,bout;
  
  full_subtractor dut(a,b,c,difference,bout);
  initial begin
    $monitor("time=%0t a=%b b=%b c=%b difference =%b bout=%b ",$time,a,b,c,difference,bout);
    $dumpfile("fs.vcd");
    $dumpvars(1);
    
    a=0;b=0;c=0;#1;
    a=1;b=0;c=0;#1;
    a=0;b=1;c=0;#1;
    a=0;b=0;c=1;#1;
    a=1;b=1;c=0;#1;
    a=0;b=1;c=1;#1;
    a=1;b=1;c=1;#1;
    $finish;
  end
endmodule
