//testbench
module S_R_latch_tb;
  reg s,r;
  wire q,qn;
  
  S_R_latch uut(.s(s),.r(r),.q(q),.qn(qn));
  initial begin
    s=0;
    r=0;
    $monitor("time =%0t s=%d r=%d q=%d qn=%d ",$time,s,r,q,qn);
    $dumpfile("dump.vcd");
    $dumpvars(1);
    #10
    s=1;r=0;#10;//set
    s=0;r=1;#10//reset;
    s=0;r=0;#10//previous state
    s=1;r=1;//invalid
    #10;
    $finish;
  end
endmodule