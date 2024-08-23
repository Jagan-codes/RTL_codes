module clock_phasing(
  input clk,reset,
  output clk_0,clk_90,clk_180,clk_270
);
  reg [1:0]cnt;
  reg div_2;
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        cnt<=2'b00;
      else
        cnt<={~cnt[0],cnt[1]};
    end
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        div_2<=1'b0;
      else
        div_2<=~div_2;
    end
  assign clk_0=cnt[0];
  assign clk_90=cnt[1]^div_2;
  assign clk_180=~cnt[1];
  assign clk_270=~clk_90;
endmodule
        
        
  
  