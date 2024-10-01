`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 21:32:15
// Design Name: 
// Module Name: vga_test
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


module vga_test(
  input clk,
  input reset,
  input [11:0]sw,
  output hsync,
  output vsync,
  output [11:0]rgb
);
  
  reg [11:0] rgb_r;
  wire video_on;
  
  vga_controller DUT(.clk(clk),.reset(reset),.hsync(hsync),.vsync(vsync),.video_on(video_on),.p_tick(),.x(),.y());
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        rgb_r<=0;
      else
        rgb_r<=sw;
    end
  
  assign rgb=(video_on)?rgb_r:12'b0;
endmodule
