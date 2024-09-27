`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2024 21:15:49
// Design Name: 
// Module Name: pwm
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

module pwm(
input clk,
input i_duty,//increase duty cycle
input d_duty,//decrease duty cycle
output pwm_out
);
wire  clk_en;
reg[27:0]count_deb=0;//counter for creating slow clk
wire t1,t2,d_i;
wire t3,t4,d_d;
reg [3:0] count_pwm=0;
reg[3:0] duty_cycle=5;//initial duty cycle 40%

always@(posedge clk)
    begin
       count_deb<=count_deb+1;
       if(count_deb>=1)
          count_deb<=0;
    end
    
assign clk_en=(count_deb==1)?1:0;
 
df d1(clk,clk_ena,i_duty,t1);
df d2(clk,clk_ena,t1,t2);

assign d_i=t1&(~t2)&clk_en;

df d3(clk,clk_en,d_duty,t3);
df d4(clk,clk_en,t3,t4);

assign d_d=t3&(~t4)& clk_ena;

always@(posedge clk)
   begin
      if(d_i==1 && duty_cycle<=9)
        duty_cycle<=duty_cycle+2;
      else if(d_d==1 && duty_cycle>=1)
        duty_cycle<=duty_cycle - 2;
   end
   
always@(posedge clk)
  begin
    count_pwm<=count_pwm+1;
    if(count_pwm>=9)
      count_pwm<=0;
  end
  
  assign pwm_out=count_pwm<duty_cycle?1:0;
endmodule

module df(
input clk,
input en,
input d,
output reg q
);
always@(posedge clk)
   begin
     if(en==1)
       q<=d;
   end
endmodule