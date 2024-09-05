module sequence_detector_mealy_0010(
  input clk,
  input reset,
  input in,
  output reg out
);
  parameter [1:0] IDLE=3'b00,
                  s1=3'b01,
                  s2=3'b10,
                  s3=3'b11;
  reg [1:0] state,next_state;
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        state<=IDLE;
      else
        state<=next_state;
    end
  
  always@(*)
    begin
      case(state)
        IDLE:
          begin
            out<=0;
            if(in)
              next_state<=IDLE;
            else
              next_state<=s1;
          end
        
        s1:
          begin
            out<=0;
            if(in)
              next_state<=IDLE;
            else
              next_state<=s2;
          end
        
        s2:
          begin
            out<=0;
            if(in)
              next_state<=s3;
            else
              next_state<=s1;
          end
        
        s3:
          begin
            if(in)
              begin
                out<=0;
                next_state<=IDLE;
              end
            else
              begin
                out<=1;
                next_state<=s1;//sequence detected
              end
          end
        default:
          begin
            out<=0;
            next_state<=IDLE;
          end
        
      endcase
    end
endmodule
        