module serial_adder(
  input clk,
  input reset,
  input a,
  input b,
  input start,
  output reg cout,
  output reg sum
);
  reg [3:0]state;
  reg carry_in;
  parameter IDLE=3'b000,
             S_add=3'b001,
             DONE=3'b111;
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        begin
          carry_in<=1'b0;
          state<=IDLE;
          sum<=1'b0;
          cout<=1'b0;
        end
      else begin
        case(state)
          IDLE: begin
            if(start)
              begin
                state<=S_add;
                carry_in<=1'b0;
              end
          end
          S_add: begin
            state<=DONE;
            sum<=a^b^carry_in;
            cout<=(a&b)|(b&carry_in)|(a&carry_in);
            carry_in<=cout;
          end
          DONE: begin
            state<=IDLE;
          end
        endcase
      end
    end
endmodule
            
          
       