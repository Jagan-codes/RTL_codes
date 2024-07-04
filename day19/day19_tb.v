module demux4_1_tb;
  reg [1:0] sel;
  reg i;
  wire y0,y1,y2,y3;
  
  demux4_1 dut(sel,i,y0,y1,y2,y3);
  initial begin
    $monitor("time=%0t sel=%b i=%b y0=%b y1=%b y2=%b y3=%b",$time,sel,i,y0,y1,y2,y3);
    $dumpfile("demux4_1.vcd");
    $dumpvars(1);
    i=1;
    sel=2'b00;#5;
    sel=2'b01;#5;
    sel=2'b10;#5;
    sel=2'b11;#5;
  end
endmodule
             
             