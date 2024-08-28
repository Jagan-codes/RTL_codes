`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 18:20:51
// Design Name: 
// Module Name: check_Armstrong
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module check_Armstrong(
  input [8:0]num,
  output reg a_out);
  
  parameter Armstrong=1,notarmstrong=0;
  always@(num)
    begin
      a_out=check_armstrong(num);
    end
  function check_armstrong;
    input [8:0]num;
    reg [8:0]t_n;
    reg [8:0]r;//remainder
    reg [8:0]res;//result
    integer i;
    begin
      res=9'd0;
      t_n=num;//temp num
      for(i=0;i<3;i=i+1)
        begin
          if(t_n==0)
            begin
                i=3;
            end
          else
             r=t_n%10;
             res=res+(r*r*r);
             t_n=t_n/10;
        end
      if(res==num)
        begin
          check_armstrong=Armstrong;
        end
      else
        begin
          check_armstrong=notarmstrong;
        end
      end
  endfunction
endmodule
        
          
          
      
      