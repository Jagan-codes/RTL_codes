module dlatch_tb;
  reg clk,d;
  wire q,q_bar;
  
  dlatch dut(clk,d,q,q_bar);
  initial begin
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b q=%b q_bar=%b",$time,clk,q,q_bar);
    $dumpfile("dlatch.vcd");
    $dumpvars(1);
    clk=0;
    d=0;
    #10;
    d=1;
    #10;
    d=0;
    #10;
    d=1;
    #10
    $finish;
  end
endmodule

    
  