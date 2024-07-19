module barrel_shifter(input [3:0] data,input [1:0] shift_amt,input dir,output [3:0] shifted_output);
  
  wire [3:0] shift_left,shift_right;
  
  //shift left
  
  assign shift_left=(shift_amt==2'b00)?data:
                    (shift_amt==2'b01)?{data[2:0],1'b0}:
                    (shift_amt==2'b10)?{data[1:0],2'b00}:
                    {data[0],3'b000};
  
  //shift right
  
  assign shift_right=(shift_amt==2'b00)?data:
                     (shift_amt==2'b01)?{1'b0,data[3:1]}:
                     (shift_amt==2'b10)?{2'b00,data[3:2]}:
                     {3'b000,data[2]};
  
  //shifted output
  
  assign shifted_output=dir?shift_right:shift_left;
  
endmodule
  
  //0 for shift left 1 for shift right