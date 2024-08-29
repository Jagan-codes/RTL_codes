module clk_edge_detector_tb;
  reg clk;
  reg temp_clk;
  wire pos_edge,neg_edge,dual_edge;
  
  clk_edge_detector DUT(.clk(clk),.temp_clk(temp_clk),.pos_edge(pos_edge),.neg_edge(neg_edge),.dual_edge(dual_edge));
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    temp_clk=0;
    forever #5.5 temp_clk=~temp_clk;
  end
    
  initial begin
    $monitor("time=%0t clk=%b temp_clk =%b posedge=%b negedge=%b dualedge=%b",$time,clk,temp_clk,pos_edge,neg_edge,dual_edge);
    $dumpfile("clk_edge_detector.vcd");
    $dumpvars(1);
    
    #100;
    $finish;
  end
endmodule