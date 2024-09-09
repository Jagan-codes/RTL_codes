module password_lock_fsm(
  input clk,
  input reset,
  input [3:0] digit,
  input enter,//to check whether the given password is correct or wrong
  output reg unlock);
  
  parameter [2:0] IDLE=3'b000,
                  input1=3'b001,
        input2=3'b010,
                  input3=3'b011,
                  input4=3'b100;
  
  reg [2:0] state,next_state;
  
  reg [3:0] correct_password [3:0];//user defined password 4 digits
  reg [3:0] user_input [3:0];
  integer i;
  initial begin
    correct_password[0]=4'd7;
    correct_password[1]=4'd7;
    correct_password[2]=4'd7;
    correct_password[3]=4'd7;
  end
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        begin
          state<=IDLE;
          unlock<=0;
          for(i=0;i<4;i=i+1)
            user_input[i]<=4'd0;
        end
      else
        state<=next_state;
    end
  
  always@(*)
    begin
      unlock<=0;
      next_state<=state;
      case(state)
        IDLE:
          begin
            if(enter)
              next_state<=input1;
          end
        
        input1:
          begin
            user_input[0]=digit;
            next_state<=input2;
          end
        
        input2:
          begin
            user_input[1]=digit;
            next_state<=input3;
          end
        
        input3:
          begin
            user_input[2]=digit;
            next_state<=input4;
          end
        
        input4:
          begin
            user_input[3]=digit;
            if(enter)
              begin
                if(correct_password[0]==user_input[0]&&
                   correct_password[1]==user_input[1]&&
                   correct_password[2]==user_input[2]&&
                   correct_password[3]==user_input[3])
                  begin
                    unlock<=1;
                  end
                    next_state<=IDLE;
              end
                else
                  next_state<=IDLE;
          end
        
        
        default: next_state<=IDLE;
      endcase
    end
endmodule
                  
                   
            
          
      