module even_or_odd_tb;
  reg [3:0]number;
  wire [3:0]even_odd;
  
  even_or_odd DUT(number,even_odd);
  always
    begin
      number=4'd8;
      #10;
      number=4'd15;
      #10;
      number=4'd2;
      #10;
      number=4'd3;
      #10;
      number=4'd10;
      #10;
      number=4'd9;
      #10;
      number=4'd12;
      #10;
      number=4'd14;
      #10;
    end
  
  initial 
    #90 $finish;
endmodule
      
      