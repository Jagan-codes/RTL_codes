//design
module mod_por(input [1:0] sel,input [31:0] in0,in1,in2,in3, output reg [31:0] out);
  always@(*)
    begin
      case(sel)
          2'b00: out=in0;
          2'b01: out=in1;
          2'b10: out=in2;
          2'b11: out=in3;
          default: out =32'h00000000;
       endcase
    end
     
 endmodule
      
      
  

  
 
             
  
                  
                  
                