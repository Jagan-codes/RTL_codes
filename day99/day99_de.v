`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 20:55:31
// Design Name: 
// Module Name: vga controller
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

module vga_controller(
  input clk,//100mhz
  input reset,
  output video_on,
  output hsync,//horizontal_sync
  output vsync,//vertical sync
  output p_tick,
  output [9:0] x,
  output [9:0]y
);
  parameter HD=640,//horizontal display
            HF=48,//front porch
            HB=16,//back porch
            HR=96,//horizontal retrace
            HMAX=HD+HF+HB+HR-1;//max value(0-799)
  
  parameter VD=480,//vertical display
            VF=16,//front porch
            VB=33,//back porch
            VR=2,//vertical retrace
            VMAX=VD+VF+VB+VR-1;//max value(0-680)
  
  reg [1:0] r_25_mhz;
  wire w_25_mhz;
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        r_25_mhz<=0;
      else
        r_25_mhz<=r_25_mhz+1;
    end
  
  assign w_25_mhz=(r_25_mhz==0)?1:0;
  reg [9:0] h_c,h_c_next;
  reg [9:0] v_c,v_c_next;
  
  reg v_sync,h_sync;
  wire v_sync_n,h_sync_n;
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        begin
          v_c<=0;
          h_c<=0;
          v_sync<=0;
          h_sync<=0;
        end
      else
        begin
          v_c<=v_c_next;
          h_c<=h_c_next;
          v_sync<=v_sync_n;
          h_sync<=h_sync_n;
        end
    end
  
  always@(posedge w_25_mhz,posedge reset)
    begin
      if(reset)
        h_c_next<=0;
      else
        begin
          if(h_c==HMAX)
            h_c_next=0;
          else
            h_c_next=h_c+1;
        end
    end
  
  always@(posedge w_25_mhz,posedge reset)
    begin
      if(reset)
        v_c_next=0;
      else 
        if(h_c==HMAX)
          begin
            if(v_c==VMAX)
              v_c_next=0;
            else
              v_c_next=v_c+1;
          end
    end
  assign h_sync_n=(h_c>=(HD+HB)&& h_c<=(HD+HB+HR-1));
  assign v_sync_n=(v_c>=(VD+VB) && v_c<=(VD+VB+VR-1));
  assign video_on=(h_c<HD)&&(v_c<VD);
  
  assign hsync=h_sync;
  assign vsync=v_sync;
  assign x=h_c;
  assign y=v_c;
  assign p_tick=w_25_mhz;
  
endmodule
  
  
        
        
  
  
  
 
  
  
  
  
  
  
  
  
  
