module elevator_control(
  input clk,
  input reset,
  input [1:0]floor_request,
  output reg door_open,
  output reg [1:0]current_floor,
  output reg moving_up,
  output reg moving_down
);
  parameter [2:0] IDLE=3'b000,
                  MOVING_UP=3'b001,
                  MOVING_DOWN=3'b010,
                  DOOR_OPEN=3'b011,
                  DOOR_CLOSE=3'b100;
  
  reg [2:0]state;
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        begin
          state<=IDLE;
          door_open<=0;
          current_floor<=0;
          moving_up<=0;
          moving_down<=0;
        end
      else 
        case(state)
          IDLE:
            begin
              if(floor_request>current_floor)
                begin
                  state<=MOVING_UP;
                  moving_up=1;
                end
              else if(floor_request<current_floor)
                begin
                  state<=MOVING_DOWN;
                  moving_down=1;
                end
              else
                begin
                  state<=DOOR_OPEN;
                  door_open<=1;
                end
            end
          
          MOVING_UP:
            begin
              moving_up<=1;
              if(current_floor==floor_request)
                begin
                  state<=DOOR_OPEN;
                  moving_up=0;
                  door_open=1;
                end
              else
                begin
                  current_floor=current_floor+1;
                end
            end
          
          MOVING_DOWN:
            begin
              moving_down=1;
              if(current_floor==floor_request)
                begin
                  state<=DOOR_OPEN;
                  moving_down=0;
                  door_open=1;
                end
              else
                begin
                  current_floor=current_floor-1;
                end
            end
          
          DOOR_OPEN:
            begin
              door_open=1;
              state<=DOOR_CLOSE;
            end
          
          DOOR_CLOSE:
            begin
              door_open<=0;
              state<=IDLE;
            end
          default:
            state<=IDLE;
        endcase
    end
endmodule
          
          
          
              
                  
          
          
          