//design
module S_R_latch(input s,r,output reg q,qn);
  always@(*)
    begin
    	if(s&&~r)
          begin
      		q=1;//set
            qn=0;
          end
      else if(~s&&r)
        begin
          q=0;//reset
          qn=1;
        end
      else if(~s&&~r)
        begin
          q=q;//previous state
          qn=qn;
        end
      else if(s&&r)
        begin
          q=2'bxx;//invalid state 
          qn=2'bxx;
        end
    end
endmodule



    
  
  