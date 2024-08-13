module dynamic_priority_arbiter(
  input clk,
  input reset,
  input [3:0]req,
  output reg [3:0]gnt
);
  reg [3:0]prior;
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        prior<=4'b0001;
      else
        begin
          if(gnt[0])
            prior<=4'b0010;
          else if(gnt[1])
            prior<=4'b0100;
          else if(gnt[2])
            prior<=4'b1000;
          else if(gnt[3])
            prior<=4'b0001;
        end
    end
  always@(*)
    begin
      case(prior)
        4'b0001:gnt=req[0]?4'b0001:4'b0000;
        4'b0010:gnt=req[1]?4'b0010:4'b0000;
        4'b0100:gnt=req[2]?4'b0100:4'b0000;
        4'b1000:gnt=req[3]?4'b1000:4'b0000;
        default:gnt=4'b0000;
      endcase
    end
endmodule
        