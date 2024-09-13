module ATM_FSM(
  input clk,
  input reset,
  input card_in,
  input [3:0] entered_pin,
  input balance_req,
  input withdraw_req,
  input deposit_req,
  input [7:0] amount,
  output reg [8:0]curr_balance,
  output reg transaction_completed,
  output reg pin_correct,
  output reg [2:0]state
);
  parameter [2:0] IDLE=3'b000,
                  CARD_INSERT=3'b001,
                  PIN_ENTRY=3'b010,
                  MAIN_MENU=3'b011,
                  BALANCE_CHECK=3'b100,
                  WITHDRAW=3'b101,
                  DEPOSIT=3'b110,
                  COMPLETE=3'b111;
  
  wire [3:0] default_pin;
  assign default_pin=4'b1111;
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        begin
          state<=IDLE;
          pin_correct<=0;
          transaction_completed<=0;
          curr_balance<=9'b000000100;//initial balance
        end
      else
        case(state)
          IDLE:
            begin
              transaction_completed<=0;
              if(card_in)
                state<=CARD_INSERT;
            end
          
          CARD_INSERT:
              state<=PIN_ENTRY;
          
          PIN_ENTRY:
            begin
              if(default_pin==entered_pin)
                begin
                  pin_correct<=1;
                  state<=MAIN_MENU;
                end
              else
                begin
                  pin_correct<=0;
                  state<=IDLE;
                end
            end
          
          MAIN_MENU:
            begin
              if(balance_req)
                state<= BALANCE_CHECK;
              else if(withdraw_req)
                state<=WITHDRAW;
              else if(deposit_req)
                state<=DEPOSIT;
            end
          
          BALANCE_CHECK:
            begin
              state<=MAIN_MENU;
            end
          
          WITHDRAW:
            begin
              if(curr_balance>amount)
                 begin
                   curr_balance=curr_balance-amount;
                   state<=COMPLETE;
                 end
              else
                state<=MAIN_MENU;
            end
          
          DEPOSIT:
            begin
              curr_balance<=curr_balance+amount;
              state<=COMPLETE;
            end
          
          COMPLETE:
            begin
              transaction_completed<=1;
              state<=IDLE;
            end
          
          default:
            state<=IDLE;
        endcase
    end
endmodule
              
              
            