`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2024 21:16:44
// Design Name: 
// Module Name: pwm_tb
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



`timescale 1ns / 1ps 
module pwm_tb;
 reg clk;
 reg i_duty;
 reg d_duty;
 wire pwm_out;

 pwm DUT(.clk(clk),.i_duty(i_duty),.d_duty(d_duty),.pwm_out(pwm_out));
initial begin
    clk=0;
    forever #5 clk=~clk;
end

 initial begin
 
  i_duty=0;
  d_duty=0;
  #100;
  i_duty=1;
  #100;
  i_duty=0;
  #100;
  i_duty=1;
  #100;
  i_duty=0;
  #100;
  i_duty=1;
  #100;
  i_duty=0;
  #100;
  d_duty=1;
  #100;
  d_duty=0;
  #100;
  d_duty=1;
  #100;
  d_duty=0;
  #100;
  d_duty=1;
  #100;
  d_duty=0;
  #100;
  d_duty=1;
  #100;
  d_duty=0;
  $finish;
 end
endmodule