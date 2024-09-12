module washing_machine_fsm(
  input clk,
  input reset,
  input start,
  input [7:0]water_level,
  input door_closed,
  output reg wash,
  output reg rinse,
  output reg spin,
  output reg fault
);
  
  parameter [2:0] IDLE=3'b000,
                  FILLWATER=3'b001,
                  WASHING=3'b010,
                  RINSING=3'b011,
                  SPINNING=3'b100,
                  FAULT=3'b101;
  
  reg [2:0] state,next_state;
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        state<=IDLE;
      else
        state<=next_state;
    end
  
  always@(*)
    begin
      wash=0;
      rinse=0;
      spin=0;
      fault=0;
      case(state)
        IDLE:
          begin
            if(start && door_closed)
              next_state<=FILLWATER;
            else if(~door_closed)
              next_state<=FAULT;
            else
              next_state<=IDLE;
          end
        
        FILLWATER:
          begin
            if(water_level>=8'd50)
              next_state<=WASHING;
            else 
              next_state<=FILLWATER;
          end
        
        WASHING:
          begin
            wash=1;
            if(water_level<50)
              next_state=RINSING;
            else
              next_state<=WASHING;
          end
        
        RINSING:
          begin
            rinse=1;
            next_state<=SPINNING;
          end
        
        SPINNING:
          begin
            spin=1;
            next_state<=FAULT;
          end
        
        FAULT:
          begin
          fault=1;
            if(door_closed)
              next_state<=IDLE;
            else
              next_state<=FAULT;
          end
        
        default:
          next_state<=IDLE;
      endcase
    end
endmodule
              
          
        
        