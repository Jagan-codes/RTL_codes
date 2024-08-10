module round_robin_arbitor(
  input clk,
  input reset,
  input [3:0] r,//request
  output reg [3:0] g//granted
);
  reg [3:0]p;//present state
  reg [3:0]next_state;
  parameter sideal =4'b0000;
  parameter [2:0]s0=3'b001;
  parameter [2:0]s1=3'b010;
  parameter [2:0]s2=3'b011;
  parameter [2:0]s3=3'b100;
  
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        p<=sideal;//ideal
      else
        p<=next_state;
    end
  always@(*)
    begin
      case(p)
        sideal:
          begin
            if(r[0])
              next_state<=s0;
            else if(r[1])
              next_state<=s1;
            else if(r[2])
              next_state<=s2;
            else if(r[3])
              next_state<=s3;
            else
              next_state<=sideal;
          end
        s0:
          begin
            if(r[1])
              next_state<=s1;
            else if(r[2])
              next_state<=s2;
            else if(r[3])
              next_state<=s3;
            else if(r[0])
              next_state<=s0;
            else
              next_state<=sideal;
          end
        s1:
          begin
            if(r[2])
              next_state<=s2;
            else if(r[3])
              next_state<=s3;
            else if(r[0])
              next_state<=s0;
            else if(r[1])
              next_state<=s1;
            else
              next_state<=sideal;
          end
        s2:
          begin
            if(r[3])
              next_state<=s3;
            else if(r[0])
              next_state<=s0;
            else if(r[1])
              next_state<=s1;
            else if(r[2])
              next_state<=s2;
            else if(r[3])
              next_state<=s3;
            else
              next_state<=sideal;
          end
        s3:
          begin
            if(r[0])
              next_state<=s0;
            else if(r[1])
              next_state<=s1;
            else if(r[2])
              next_state<=s2;
            else if(r[3])
              next_state<=s3;
            else
              next_state<=sideal;
          end
        default:
          begin
            if(r[0])
              next_state<=s0;
            else if(r[1])
              next_state<=s1;
            else if(r[2])
              next_state<=s2;
            else if(r[3])
              next_state<=s3;
            else
              next_state<=sideal;
          end
      endcase
    end
  
  always@(*)
    begin
      case(p)
        s0:g=4'b0001;
        s1:g=4'b0010;
        s2:g=4'b0100;
        s3:g=4'b1000;
      endcase
    end
endmodule