module credit_card_fsm(
  input clk,
  input reset,
  input swipe_card,
  input valid_data,
  input sufficient_fund,
  output reg transaction_status
);
  
   parameter [1:0] READING=2'b00,
                 PROCESSING=2'b01,
                 AUTHORIZED=2'b10,
                 DECLINED=2'b11;
  
  reg [1:0] curr_state,next_state;
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        curr_state<=READING;
      else
        curr_state<=next_state;
    end
  
  always@(*)
    begin
      case(curr_state)
        READING:
          begin
            if(swipe_card)
              next_state<=PROCESSING;
            else
              next_state<=READING;
          end
        
        PROCESSING:
          begin
            if(valid_data&&sufficient_fund)
              next_state<=AUTHORIZED;
            else
              next_state<=PROCESSING;
          end
        
        AUTHORIZED:
          begin
            next_state<=READING;
          end
        
        DECLINED:
           begin
            next_state<=READING;
           end
        
        default:
          next_state<=READING;
        
      endcase
    end
  always@(*)
    begin
      case(curr_state)
        AUTHORIZED:
          transaction_status<=1;
        DECLINED:
          transaction_status<=0;
        default:
          transaction_status<=0;
      endcase
    end
  
endmodule
        
            
          