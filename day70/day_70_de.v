

module fifo#(parameter depth=16,width=8)(
  input [width-1:0]data,
  input wr_ena,
  input rd_ena,clk,reset,
  output reg [width-1:0]data_out,
  output reg empty,
  output reg full
);
  //internal registers
  reg [width-1:0] mem [0:depth-1] ;//memory
  reg [width-1:0]r_p=0;//read pointer
  reg [width-1:0]w_d=0;//write pointer
  reg [width-1:0]n_r_p;//next read pointer
  reg [width-1:0]n_w_d;//next write pointer
  reg [width-1:0]items=0;
  
  always@(posedge clk)
    begin
      if(reset)
        begin
          r_p<=0;
          w_d<=0;
          n_r_p<=0;
          n_w_d<=0;
          items<=0;
          empty<=1;
          full<=0;
        end
      else
        begin
          r_p<=n_r_p;
          w_d<=n_w_d;
          empty<=(items==0);
          full<=(items==depth);
          
          if(wr_ena&&!full)
            begin
              mem[w_d]<=data;
              n_w_d<=(w_d+1)%depth;
              items<=items+1;
            end
          
          if(rd_ena && !empty)
            begin
              data_out<=mem[r_p];
              n_r_p<=(r_p+1)%depth;
              items<=items-1;
            end
        end
    end
endmodule
            
          
  
  
  
  
  
