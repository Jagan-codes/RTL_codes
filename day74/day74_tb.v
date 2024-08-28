`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 18:21:41
// Design Name: 
// Module Name: check_Armstrong_tb
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

module check_Armstrong_tb;
  reg [8:0]num;
  wire a_out;
  
  
  check_Armstrong DUT(num,a_out);
  initial begin
    $monitor("time=%0t num=%d a_out=%b",$time,num,a_out);
    
    num=9'd153;#10;
    num=9'd125;#10;
    num=9'd180;#10;
    num=9'd176;#10;
    num=9'd370;#10;
    num=9'd70;#10;
    num=9'd407;#10;
    num=9'd200;#10;
    num=9'd371;#10;
    $finish;
  end
endmodule
