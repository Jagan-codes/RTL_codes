//testbench
module mux2_tb;
  reg i0,i1,sel;
  wire y;
  mux2_1 mux(.i0(i0),.i1(i1),.sel(sel),.y(y));
  initial begin
    $monitor("time:%t i0=%b i1=%b sel=%b y=%b",$time,i0,i1,sel,y);
    $dumpfile("dump.vcd");
    $dumpvars(1);
    i0=0;
    i1=1;
    sel=0;
    #1;
    sel=1;
    #1;
  end
endmodule