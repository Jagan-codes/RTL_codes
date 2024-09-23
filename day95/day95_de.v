module car_parking_system(
  input clk,
  input reset,
  input entry,//sense entry
  input exit,//sense exit
  input [1:0] p1,p2,//password
  output reg green_light,red_light,
  output reg [3:0]space_utilized,space_available,cars
);
  
  reg [3:0] space=4'b1000;//overall space by default (8)
  reg [2:0]curr_state,next_state;
  reg [1:0] wait_time;
  
  parameter [2:0] IDLE=3'b000,
                  WAIT=3'b001,
                  PASSWORD_CORRECT=3'b010,
                  PASSWORD_WRONG=3'b011,
                  STOP=3'b100;
  
  
  always@(posedge clk)
    begin
      if(reset)
        curr_state<=IDLE;
      else
        curr_state<=next_state;
    end
  
  //parking space
  always@(posedge clk)
    begin
      if(reset)
        begin
          space_utilized<=4'b0000;
          space_available<=space;
          cars<=4'd0;//CARS COUNT 
        end
      else if(entry&&space_available>0)
        begin
          space_available<=space_available-1;
          space_utilized<=space_utilized+1;
          cars<=cars+1;
        end
      else if(exit&&space_utilized>0)
        begin
          space_available<=space_available+1;
          space_utilized<=space_utilized-1;
          cars<=cars-1;
        end
      else
        begin
          space_available<=4'd0;
          space_utilized<=4'd0;
          cars<=4'd0;
        end
    end
  
  //waiting time
  
  always@(posedge clk)
    begin
      if(reset)
        wait_time<=2'b00;
      else
        if(curr_state==WAIT)
          begin
            wait_time<=wait_time+1;
          end
        else
          wait_time<=0;
    end
  
  always@(*)
    begin
      case(curr_state)
        IDLE:
          begin
            if(entry&&space_available>0)
              next_state<=WAIT;
            else
              next_state<=IDLE;
          end
        
        WAIT:
          begin
            if(wait_time<=2'b11)
              next_state<=WAIT;
            else
              begin
                if(p1==2'b11 && p2==2'b11)
                  begin
                    next_state<=PASSWORD_CORRECT;
                  end
                else
                  begin
                    next_state<=PASSWORD_WRONG;
                  end
              end
          end
        PASSWORD_CORRECT:
          begin
            if(entry==1&&exit==1)
              begin
                next_state<=STOP;
              end
            else if(exit==1)
              begin
                next_state<=IDLE;
              end
            else
              next_state<=PASSWORD_CORRECT;
          end
        
        PASSWORD_WRONG:
          begin
            if(p1==2'b11&&p2==2'b11)//default password=11 to enter into parking slot
              next_state<=PASSWORD_CORRECT;
            else
              next_state<=PASSWORD_WRONG;
          end
        
        STOP:
          begin
            if(p1==2'b11&&p2==2'b11)
              next_state<=PASSWORD_CORRECT;
            else
              next_state<=STOP;
          end
        
        default:
          next_state<=IDLE;
      endcase
    end
  
  always@(posedge clk)
    begin
      case(curr_state)
        IDLE:
          begin
            green_light<=0;
            red_light<=0;
          end
        
        WAIT:
          begin
            green_light<=~green_light;
            red_light<=0;
          end
        
        PASSWORD_CORRECT:
          begin
            green_light<=1;
            red_light<=0;
          end
        
        PASSWORD_WRONG:
          begin
            green_light<=0;
            red_light<=1;
          end
        
        STOP:
          begin
            green_light<=0;
            red_light<=~red_light;
          end
      endcase
    end
endmodule
            
            
            