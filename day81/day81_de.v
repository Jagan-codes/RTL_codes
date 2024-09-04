module sequence_detector_1011_mealy(
  input clk,
  input reset,
  input in,
  output reg d_out
);
  parameter [2:0] IDLE=3'b000,
                  s1=3'b001,
                  s2=3'b010,
                  s3=3'b011,
                  s4=3'b100;
  
  reg [2:0]state,next_state;
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
          	d_out<=0;
            if(in)
              next_state<=s1;
            else
              next_state<=IDLE;
          end
        
        s1:
          begin
            d_out<=0;
            if(in)
              next_state<=s1;
            else
              next_state<=s2;
          end
        
        s2:
          begin
            d_out<=0;
            if(in)
              next_state<=s3;
            else
              next_state<=IDLE;
          end
        
        s3:
          begin
            if(in)
              begin
                next_state<=s1;
                d_out<=1;//sequence detected
              end
            else
              begin
                next_state<=s2;
                d_out<=0;
              end
          end
        
        default:
          begin
          	next_state<=0;
            d_out<=0;
          end
        
        
      endcase
    end
endmodule
        

            
            
          