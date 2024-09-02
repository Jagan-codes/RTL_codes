module Moore_sequence_detector_1100(//non overlapping 
  input clk,   
  input reset,  
  input in,   
  output reg out);   
  
  parameter [2:0] IDLE=3'b000,                
                  s1=3'b001,                                               s2=3'b010,                                               s3=3'b011,                                               s4=3'b100;  
  
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
            if(in)               
              next_state<=s1;             
            else               
              next_state<=IDLE;           
          end                  
        
        s1:           
          begin             
            if(in)               
              next_state<=s2;             
            else               
              next_state<=IDLE;           
          end    
        
        s2:           
          begin             
            if(in)               
              next_state<=s2;             
            else               
              next_state<=s3;           
          end                  
        
        s3:           
          begin             
            if(in)               
              next_state<=s1;             
            else               
              next_state<=s4;//sequence found 1100   
          end
        
        s4:           
          begin             
            if(in)               
              next_state<=s1;             
            else               
              next_state<=IDLE;//reset to idle state 
          end                  
        default:next_state<=IDLE;       
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