module booth_multiplier(
  input signed [7:0]m1,
  input signed [7:0]m2,//signed means it may be either +ve or -ve

  output reg signed [15:0]product
);

  reg signed [7:0] a,q,m;
  reg q_1;
  integer i;

  always @(*)begin
    a = 8'b0;        
    q = m1;          
    m = m2;          
    q_1 = 1'b0;       

    for(i= 0;i<8;i=i+1)//for 8bit multiplier the loop will run 8time
      begin
        case({q[0],q_1})
          2'b10:a=a-m;
          2'b01:a=a+m;//behaviour modeling
          default: ;
        endcase
      q_1=q[0];
      q={a[0],q[7:1]};  
      a={a[7],a[7:1]}; 
    end
    product = {a,q}; 
  end

endmodule
