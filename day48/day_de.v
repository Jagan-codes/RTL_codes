module Simple_register #(parameter n=4)(
  input clk,
  input [n-1:0]d,
  output [n-1:0]q
);
  reg [n-1:0]q_out,q_next;
  
  always@(posedge clk)
    begin
      q_out=q_next;
    end
  
  
  always@(d)
    begin
      q_next=d;  
    end
  
  assign q=q_out;
endmodule
  
      