module n_bit_comparator(a,b,lesser,greater,equal);
  parameter n=16;
  input [n-1:0] a,b;
  output reg lesser,greater,equal;
  
  always@(a,b)
    begin
      if(a>b)
        begin
          lesser=0;
          greater=1;
          equal=0;
        end
      else if(a<b)
        begin
          lesser=1;
          greater=0;
          equal=0;
        end
      else
        begin
          lesser=0;
          greater=0;
          equal=1;
        end
    end
endmodule
