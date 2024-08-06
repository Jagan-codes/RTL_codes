module restoring_division(
  input [7:0]d1,//dividend
  input [7:0]d2,//divisor
  output [7:0]q,//quotient
  output [7:0]r//remainder
);
  reg [15:0] r_d1;
  reg [7:0] r_q;
  reg [7:0] r_d2;
  reg [8:0] temp;
  
  integer i;
  
  always@(*)
    begin
      r_d1={8'b0,d1};
      r_d2=d2;
      r_q=8'b0;
      
      for(i=0;i<8;i=i+1)
        begin
          r_d1=r_d1<<1;
          r_q=r_q<<1;
          
          temp=r_d1[15:8]-r_d2;
          
          if(temp[8]==0)
            begin
              r_q[0]=1'b1;
              r_d1[15:8]=temp[7:0];
            end
        end
    end
  assign q=r_q;
  assign r=r_d1[15:8];
endmodule