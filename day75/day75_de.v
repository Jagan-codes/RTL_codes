module clk_edge_detector(
  input clk,temp_clk,
  output  pos_edge,neg_edge,dual_edge);

   assign pos_edge=clk&~temp_clk;//poseitive edge
   assign neg_edge=~clk&temp_clk;//negative edge
   assign dual_edge=clk^temp_clk;
endmodule