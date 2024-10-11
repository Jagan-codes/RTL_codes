`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 21:46:57
// Design Name: 
// Module Name: voting_machine
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


module voting_machine(
  input clk,
  input reset,
  input mode,
  input b1,//button1
  input b2,//button2
  input b3,//button3
  input b4,//button4
  output [7:0]led
);
  
  wire vv1;//valid vote1
  wire vv2;//valid vote2
  wire vv3;//valid vote3
  wire vv4;//valid vote4
  
  wire [7:0]cand1_vote_received;
  wire [7:0]cand2_vote_received;
  wire [7:0]cand3_vote_received;
  wire [7:0]cand4_vote_received;
  wire valid_vote;
  
  assign valid_vote=vv1|vv2|vv3|vv4;
  
  //instantiation of modules
  
  button_control bc1(.clk(clk),.reset(reset),.button(b1),.valid_vote(vv1));
  
  button_control bc2(.clk(clk),.reset(reset),.button(b2),.valid_vote(vv2));
  
  button_control bc3(.clk(clk),.reset(reset),.button(b3),.valid_vote(vv3));
  
  button_control bc4(.clk(clk),.reset(reset),.button(b4),.valid_vote(vv4));
  
  votelogger v1(.clk(clk),
                 .reset(reset),
                 .mode(mode),
                 .c1_vote_valid(vv1),
                 .c2_vote_valid(vv2),
                 .c3_vote_valid(vv3),
                 .c4_vote_valid(vv4),
                 .cand1_vote_received(cand1_vote_received),
                 .cand2_vote_received(cand2_vote_received),
                 .cand3_vote_received(cand3_vote_received),
                 .cand4_vote_received(cand4_vote_received));
                 
  
  mode_control m1(.clk(clk),
                  .reset(reset),
                  .mode(mode),
                  .valid_vote(valid_vote),
                  .c1_vote(cand1_vote_received),
                  .c2_vote(cand2_vote_received),
                  .c3_vote(cand3_vote_received),
                  .c4_vote(cand4_vote_received),
                  .c1_button_press(vv1),
                  .c2_button_press(vv2),
                  .c3_button_press(vv3),
                  .c4_button_press(vv4),
                  .led(led));
  

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 22:57:56
// Design Name: 
// Module Name: mode_control
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


module mode_control(
  input clk,
  input reset,
  input mode,
  input valid_vote,
  input [7:0]c1_vote,
  input [7:0]c2_vote,
  input [7:0]c3_vote,
  input [7:0]c4_vote,
  input c1_button_press,
  input c2_button_press,
  input c3_button_press,
  input c4_button_press,
  output reg [7:0]led
);
  
  reg [31:0] count;
  
  always@(posedge clk)
    begin
      if(reset)
        count<=32'd0;
      else if(valid_vote)
        count<=count+1;
      else if(count!=0 &&count<10)
        count<=count+1;
      else
        count<=0;
    end
  
  always@(posedge clk)
    begin
      if(reset)
        led<=8'd0;
      else 
        begin
          if(mode==0 && count>0)
            led<=8'hff;
          else if(mode==0)
            led<=8'd0;
          else if(mode==1)
            begin
              if(c1_button_press)
                led<=c1_vote;
              if(c2_button_press)
                led<=c2_vote;
              if(c3_button_press)
                led<=c3_vote;
              if(c4_button_press)
                led<=c4_vote;
            end
        end
    end
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 22:59:19
// Design Name: 
// Module Name: votelogger
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

module votelogger(
  input clk,
  input reset,
  input mode,
  input c1_vote_valid,
  input c2_vote_valid,
  input c3_vote_valid,
  input c4_vote_valid,
  output reg [7:0]cand1_vote_received,
  output reg [7:0]cand2_vote_received,
  output reg [7:0]cand3_vote_received,
  output reg [7:0]cand4_vote_received
);
  
  always@(posedge clk)
    begin
      if(reset)
        begin
          cand1_vote_received<=8'd0;
          cand2_vote_received<=8'd0;
          cand3_vote_received<=8'd0;
          cand4_vote_received<=8'd0;
        end
      else
        begin
          if(c1_vote_valid && mode==0)
            cand1_vote_received<=cand1_vote_received+1;
          if(c2_vote_valid && mode==0)
            cand2_vote_received<=cand2_vote_received+1;
          if(c3_vote_valid && mode==0)
            cand3_vote_received<=cand3_vote_received+1;
          if(c4_vote_valid && mode==0)
            cand4_vote_received<=cand4_vote_received+1;
        end
    end
endmodule
            
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 23:04:23
// Design Name: 
// Module Name: button_control
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

module button_control(
  input clk,
  input reset,
  input button,
  output reg valid_vote
);
  
  reg [31:0]count;
  
  always@(posedge clk)
    begin
      if(reset)
        count<=0;
      else
        begin
          if(button && count<11)
            count<=count+1;
          else if(!button)
            count<=0;
        end
    end
  
  always@(posedge clk)
    begin
      if(reset)
        valid_vote<=0;
      else 
        begin
          if(count==10)
            valid_vote<=1;
          else
            valid_vote<=0;
        end
    end
  
endmodule

