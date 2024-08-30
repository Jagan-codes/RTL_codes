module one_hot_fsm(
  input clk,reset,
  output reg [3:0]state,
  output reg [1:0]out);
  parameter [3:0] IDLE=4'b0001,
                  STATE1=4'b0010,
                  STATE2=4'b0100,
                  STATE3=4'b1000;
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        begin
          state<=IDLE;
          out<=2'b00;
        end
      else
        begin
          case(state)
            
            IDLE:
              begin
              	state<=STATE1;
                out<=2'b00;
              end
            
            STATE1:
              begin
                state<=STATE2;
                out<=2'b01;
              end
            
            STATE2:
              begin
                state<=STATE3;
                out<=2'b10;
              end
            
            STATE3:
              begin
                state<=IDLE;
                out<=2'b11;
              end
            
            default:
              state<=IDLE;
          endcase
        end
    end
endmodule
            