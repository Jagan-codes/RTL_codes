module sequence_detector_overlapping(//MOORE CIRCUIT(0101)
  input clk,
  input reset,
  input in,
  output reg out);
  parameter [2:0] IDLE=3'b000,
                  s1=3'b001,
                  s2=3'b010,
                  s3=3'b011,
                  s4=3'b100;
  
  reg [2:0]state,next_state;
  
  always@(posedge clk,posedge reset)//current state
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
            if(in)
              next_state<=IDLE;
            else
              next_state<=s1;
          end
        
        s1:
          begin
            if(in)
              next_state<=s2;
            else
              next_state<=s1;
          end
        
        s2:
          begin
            if(in)
              next_state<=IDLE;
            else
              next_state<=s3;
          end
        
        s3:
          begin
            if(in)
              next_state<=s4;//sequence detected
            else
              next_state<=s1;
          end
        
        s4:
          begin
            if(in)
              next_state<=IDLE;
            else
              next_state<=s3;
          end
        
        default: next_state<=IDLE;
      endcase
    end
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        out<=0;
      else if(state==s4)
        out<=1;
      else
        out<=0;
    end
endmodule

            
  