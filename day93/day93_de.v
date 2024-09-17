//apb slave
module amba_apb(
  input p_clk,
  input p_reset,
  input p_sel,
  input [7:0] p_ad,//address
  input p_wr,
  input [31:0]p_wdata,//write data
  input p_ena,
  output reg p_ready,
  output reg [31:0] p_rdata,//read data
  output reg p_slverr,//error
  output reg[1:0] next_state
);
  
  parameter [1:0] IDLE=2'b00,
                  SETUP=2'b01,
                  ACCESS=2'b11;
  
  reg [1:0] state;
  reg [31:0] memory[31:0];//32*32 array
  
  always@(posedge p_clk)
    begin
      if(p_reset)
        begin
          state<=IDLE;
        end
      else
        begin
          state<=next_state;
        end
    end
  
  always@(*)
    begin
      
      case(state)
        IDLE:
          begin
            if(!p_sel&&!p_ena)
              begin
                 next_state=IDLE;
                 p_ready=0;
              end
            else
              begin
                next_state=SETUP;
              end
          end
        
        
        SETUP:
          begin
            if(!p_sel&&!p_ena)
              begin
                next_state=IDLE;
                p_ready=0;
              end
            else 
              begin
                next_state=ACCESS;
                if(p_wr)
                  begin
                  	memory[p_ad]=p_wdata;
                    p_ready=1;
                    p_slverr=0;
                  end
                else
                  begin
                    p_rdata=memory[p_ad];
                    p_ready=1;
                    p_slverr=0;
                  end
              end
          end
        
        ACCESS:
          begin
            if(!p_ena|!p_sel)
              begin
                next_state=IDLE;
                p_ready=0;
              end
          end
      endcase
    end
endmodule
          
      
      
              
        