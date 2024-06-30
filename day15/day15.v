module shift_register(input clk,reset,shift_left,shift_right,s_in,output reg [3:0] data);
always@(posedge clk,posedge reset)
  begin
    if(reset)
      data<=4'b0000;
    else if(shift_left)
      data<={data[2:0],s_in};
    else if(shift_left)
      data<={s_in,data[3:1]};
  end
endmodule