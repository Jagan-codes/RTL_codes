module digital_clock(input clk,reset,output reg [3:0] count);
  
  reg [3:0] next_count;
  always@(posedge clk or posedge reset)//sequential block
    begin
      if(reset)
        count<=8'b0000;
      else
        count<=next_count;
    end
  
  always@(*)//combinational block
    begin
      if(count==4'b1111)
        next_count=8'b0000;
      else
        next_count=count+1;
    end
  
  reg led;
  always@(posedge clk or posedge reset)//sequential block for led 
    begin
      if(count==4'b1000)
        led<=1'b1;
      else
        led<=1'b0;
    end
endmodule
      
        