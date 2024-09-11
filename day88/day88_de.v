module temperature_controller(
  input clk,
  input reset,
  input [7:0]temperature,
  input [7:0]set_point,
  input sensor_valid,
  output reg heat,
  output reg cold);
  
  parameter [1:0] IDLE=2'b00,
                  HEATING=2'b01,
                  COOLING=2'b10,
                  FAULT=2'b11;
  
  parameter tolerance=3;
  
  reg [1:0] curr_state,next_state;
  
  //curr_state and output
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        begin
        	curr_state<=IDLE;
            heat<=0;
            cold<=0;
        end
      else
        begin
          curr_state<=next_state;
          
          case(next_state)
            HEATING:
              begin
                heat<=1;
                cold<=0;
              end
            
            COOLING:
              begin
                heat<=0;
                cold<=1;
              end
            
            IDLE:
              begin
                heat<=0;
                cold<=0;
              end
            
            FAULT:
              begin
                heat<=0;
                cold<=0;
              end
            
          endcase
        end
    end
  
  //next_state logic
  always@(*)
    begin
      case(curr_state)
        IDLE:
          begin
            if(!sensor_valid)
              next_state<=FAULT;
            else if(temperature>set_point+tolerance)
              next_state<=COOLING;
            else if(temperature<set_point-tolerance)
              next_state<=HEATING;
            else
              next_state<=IDLE;
          end
        
        HEATING:
          begin
            if(!sensor_valid)
              next_state<=FAULT;
            else if(temperature>=set_point)
              next_state<=COOLING;
            else
              next_state<=HEATING;
          end
        
        COOLING:
          begin
            if(!sensor_valid)
              next_state<=FAULT;
            else if(temperature<=set_point)
              next_state<=HEATING;
            else
              next_state<=COOLING;
          end
        
        FAULT:
           begin
            if(sensor_valid)
              next_state<=IDLE;
            else
              next_state<=FAULT;
           end
        default:
          next_state<=IDLE;
      endcase
    end
endmodule
          
            
            
        
                
      