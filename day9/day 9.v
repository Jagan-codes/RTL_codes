//design//procedure assignment has two types
//1.blocking assignments 2.non-blocking assignments
module Traffic_light(input clk,reset,output reg [2:0] light);
  parameter RED=3'b100;
  parameter YELLOW=3'b010;
  parameter GREEN=3'b001;
  
  reg [2:0] state,next_state;
  
  //sequential block
  always@(posedge clk)
    begin
      if(reset)
        state<=RED;//non-blocking
      else
        state<=next_state;//non-blocking
    end
  
  //combinational block
  always@(*)
    begin
      case(state)
        RED: next_state=YELLOW;//blocking
        YELLOW:next_state=GREEN;//blocking
        GREEN:next_state=RED;//blocking
        default: next_state=RED;//blocking
      endcase
    end
  
  always@(state)
    begin
      light=state;
    end;
endmodule
  