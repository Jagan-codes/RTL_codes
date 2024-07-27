module ring_counter(
  input clk,
  input reset,
  output reg [3:0] q//output
);
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        q<=4'b1100;
      else
        begin
          q[3]<=q[0];
          q[2]<=q[3];
          q[1]<=q[2];
          q[0]<=q[1];
        end
    end
endmodule
     