`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 21:48:21
// Design Name: 
// Module Name: voting_machine_tb
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

`timescale 1ns/1ps

module voting_machine_tb;
  reg clk;
  reg reset;
  reg mode;
  reg b1;
  reg b2;
  reg b3;
  reg b4;
  wire [7:0] led;
  
  
  voting_machine DUT(clk,
                     reset,
                     mode,
                     b1,
                     b2,
                     b3,
                     b4,
                     led);
  initial begin 
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b mode=%b b1=%b b2=%b b3=%b b4=%b ",$time,clk,reset,mode,b1,b2,b3,b4);
    $dumpfile("voting_machine.vcd");
    $dumpvars(1);
    
    reset=1;mode=0;b1=0;b2=0;b3=0;b4=0;
    #100;
    #100;
    reset=0;mode=0;b1=0;b2=0;b3=0;b4=0;
    #5;
    b1=1;b2=0;b3=0;b4=0;
    #10;
    b1=0;b2=0;b3=0;b4=0;
    #5;
    b1=0;b2=0;b3=0;b4=0;
    #200;
    b1=0;b2=0;b3=0;b4=0;
    #5;
    b1=0;b2=0;b3=0;b4=0;
    #10;
    b1=0;b2=0;b3=0;b4=0;

    
    
    
    #5;
    b1=0;b2=1;b3=0;b4=0;
    #200;
    b1=0;b2=0;b3=0;b4=0;
    #5
    b1=0;b2=0;b3=0;b4=0;
    #10;
    b1=0;b2=0;b3=0;b4=0;
    
    
    #5;
    b1=0;b2=1;b3=1;b4=0;
    #200;
    b1=0;b2=0;b3=0;b4=0;
    #5;
    b1=0;b2=0;b3=0;b4=0;
    #10;
    b1=0;b2=0;b3=0;b4=0;
    
    #5;
    mode=1;
    b1=0;b2=1;b3=0;b4=0;
    #200;
    b1=0;b2=0;b3=0;b4=0;
    #5;
    b1=0;b2=0;b3=0;b4=0;
    #10;
    b1=0;b2=0;b3=0;b4=0;
    
    #5;
    b1=0;b2=0;b3=1;b4=0;
    #200;
    b1=0;b2=0;b3=0;b4=0;
    #5;
    b1=0;b2=0;b3=0;b4=0;
    #10;
    b1=0;b2=0;b3=0;b4=0;
    $finish;
  end
endmodule
                     
    