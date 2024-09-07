module two_sequ_detector_101_0110(
  input clk,
  input reset,
  input in,
  output reg out);
parameter [2:0] IDLE=3'b000,
                s1=3'b001,
                s2=3'b010,
                s3=3'b011,
                s4=3'b100,
                s5=3'b101;


reg [2:0]state,next_state;

always@(posedge clk,posedge reset)
  begin
    if(reset)
      state<=IDLE;
    else
      state<=next_state;
  end

always@(state or in)
  begin
    case(state)
      IDLE:
        if(in)
          begin
          	next_state<=s2;
            out<=0;
          end
        else
          begin
            next_state<=s1;
            out<=0;
          end
      
      s1:
        if(in)
          begin
            next_state<=s3;
            out<=0;
          end
        else
          begin
            next_state<=s1;
            out<=0;
          end
      
      s2:
        if(in)
          begin
            next_state<=s2;
            out<=0;
          end
        else
          begin
            next_state<=s4;
            out<=0;
          end
      
      s3:
        if(in)
          begin
            next_state<=s5;
            out<=0;
          end
        else
          begin
            next_state<=s4;
            out<=0;
          end
      
      s4:
        if(in)
          begin
            next_state<=s3;
            out<=1;//sequence detected for 101
          end
        else
          begin
            next_state<=s1;
            out<=0;
          end
      
      s5:
        if(in)
          begin
            next_state<=s2;
            out<=0;
          end
        else
          begin
            next_state<=s1;
            out<=1;//sequence detected 0110;
          end
      default:
        begin
          next_state<=IDLE;
          out<=0;
        end
    endcase
  end
endmodule
            
        
      
      
    