//basic binary multiplier
module multiplier(input [3:0] a, b,output [7:0] product);
  wire [7:0] p0,p1,p2,p3;
  assign p0=b[0]?{4'b0000,a}:8'h00;
  assign p1=b[1]?{3'b000,a,1'b0}:8'h00;//partial products
  assign p2=b[2]?{2'b00,a,2'b00}:8'h00;
  assign p3=b[3]?{1'b0,a,3'b000}:8'h00;
  assign product=p0+p1+p2+p3;
endmodule