module clock_divider(input clk,reset,output div_2,div_4,div_8,div_16);
  reg [3:0] count;
  always@(posedge clk)
    begin
      if(reset)
        count<=4'b0000;
      else if(count==4'b1111)
        count<=4'b0000;
      else
        count<=count+1;
    end
  assign div_2=count[0];
  assign div_4=count[1];
  assign div_8=count[2];
  assign div_16=count[3];
endmodule
