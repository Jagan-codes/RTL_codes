module dual_edge_trigger(
  input clk,
  input reset,
  input d,
  output q
);
  
  assign q=clk?q1:q2;//q1 for rise edge trigger
  //q2 for falling edge trigger;
  
   always@(posedge clk)
    begin
      if(reset)
        q1<=1'b0;
      else
      	q1<=d;
    end
  
  always@(negedge clk)
    begin
      if(reset)
        q1<=1'b0;
      else
        q2<=d;
    end
  
 
      
  