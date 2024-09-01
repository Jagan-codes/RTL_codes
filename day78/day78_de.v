module vending_machine(
  input clk,
  input reset,
  input [1:0]coin,//01-5rs 10-10rs 11-15rs
  output reg [1:0]state,
  output reg dispense
);
  parameter [1:0] IDLE=2'b00,
                  FIVE_RUPEES=2'b01,
                  TEN_RUPEES=2'b10,
                  FIFTEEN_RUPEES=2'b11;
  
  always@(posedge clk,negedge clk)
    begin
      if(reset)
        begin
          state<=IDLE;
          dispense<=0;
        end
      else
        begin
          case(state)

            IDLE:
              begin
                dispense<=0;
                case(coin)
                  2'b01:state<=FIVE_RUPEES;
                  2'b10:state<=TEN_RUPEES;
                  default:state<=IDLE;
                endcase
              end

            FIVE_RUPEES:
              begin
                dispense<=0;
                case(coin)
                  2'b01:state<=TEN_RUPEES;
                  2'b10:state<=FIFTEEN_RUPEES;
                  default:state<=FIVE_RUPEES;
                endcase
              end

            TEN_RUPEES:
              begin
                dispense<=0;
                case(coin)
                  2'b01:state<=FIFTEEN_RUPEES;
                  2'b10:
                    begin
                      state<=IDLE;
                      dispense<=1;
                    end
                endcase
              end

            FIFTEEN_RUPEES:
              begin
                dispense<=0;
                case(coin)
                  2'b01:
                    begin
                      state<=IDLE;
                      dispense<=1;
                    end
                  2'b10:
                    begin
                      state<=IDLE;
                      dispense<=1;
                    end
                endcase
              end
            default:state<=IDLE;
          endcase
        end
    end
endmodule
              
                
          
          
          
      