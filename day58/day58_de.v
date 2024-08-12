module Fixed_priority_arbiter(
  input [3:0]req,//request
  output reg [3:0]gnt//granted output
);
  always@(req)
    begin
      
      gnt=4'b0000;//reset 
      if(req[3])
        gnt<=4'b1000;
      else if(req[0])
        gnt<=4'b0001;
      else if(req[2])
        gnt<=4'b0100;
      else if(req[1])
        gnt<=4'b0010;
      else
        gnt<=4'b0000;
    end
endmodule
      
        