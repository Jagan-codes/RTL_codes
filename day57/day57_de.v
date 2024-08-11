module mux2_1(
  input a,b,s,
  output reg y);
  always@(a,b,s)
    begin
      case(s)
        0:y=a;
        1:y=b;
        default : y=1'b0;
      endcase
    end
endmodule

module DFF(
  input clk,reset,d,
  output reg q);
  always@(posedge clk ,posedge reset)
    begin
      if(reset)
        q<=0;
      else
        q<=d;
    end
endmodule

module CN_flipflop(
  input c,n,clk,
  output q,q_bar);
  wire cn,n_b,d_w;
  
  mux2_1 m0(1'b0,c,n,cn);
  mux2_1 m1(1'b1,1'b0,n,n_b);
  mux2_1 m2(cn,n_b,q,d_w);
  
  DFF d0(.clk(clk),.reset(),.q(q),.d(d_w));
  
  assign q_bar=~q;
endmodule