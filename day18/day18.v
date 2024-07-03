module comparator(input a,b,output reg a_grt_b,a_les_b,a_eq_b);
  always@(*)
    begin
      a_grt_b=0;a_eq_b=0;a_les_b=0;
      if(a>b)
        a_grt_b<=1'b1;
      else if(a==b)
        a_eq_b<=1'b1;
      else if(a<b)
         a_les_b<=1'b1;
        
    end
endmodule
