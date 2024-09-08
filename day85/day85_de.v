module digital_watch_fsm(
  input clk,
  input reset,
  input mode_button,
  input up,
  input down,
  output reg [5:0] hour,
  output reg [5:0] minute,
  output reg alarm_trigger
);
  parameter [1:0] DISPLAY_TIME=2'b00,
                  SET_HOUR=2'b01,
                  SET_MINUTE=2'b10,
                  ALARM=2'b11;
  
  reg [1:0] c_state,next_state;
  reg [5:0] alarm_hour;
  reg [5:0] alarm_minute;
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        begin
          c_state<=DISPLAY_TIME;
          alarm_hour<=6'b0;
          alarm_minute<=6'b0;
          hour<=6'b0;
          minute<=6'b0;
        end
      else
        c_state<=next_state;
    end
  
  always@(*)
    begin
      next_state<=c_state;
      alarm_trigger=0;
      
      case(c_state)
        DISPLAY_TIME:
          begin
            if(mode_button)
              next_state<=SET_HOUR;
          end
        
        SET_HOUR:
          begin
            if(up)
              hour=(hour==23)?0:hour+1;
            else if(down)
              hour=(hour==0)?23:hour-1;
            
            if(mode_button)
              next_state<=SET_MINUTE;
          end
        
        SET_MINUTE:
          begin
            if(up)
              minute=(minute==59)?0:minute+1;
            else if(down)
              minute=(minute==0)?59:minute-1;
            
            if(mode_button)
              next_state<=ALARM;
          end
        
        ALARM:
          begin
            if(up)
              alarm_hour=(alarm_hour==23)?0:alarm_hour+1;
            else if(down)
              alarm_hour=(alarm_hour==0)?23:alarm_hour-1;
            
            
            if(hour==alarm_hour)
              alarm_trigger=1;
            
            if(mode_button)
              next_state<=DISPLAY_TIME;
          end
        default:
          next_state<=DISPLAY_TIME;
        
      endcase
    end
endmodule
              
        
        
            
        
      