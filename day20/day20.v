module gray_to_binary(input [size-1:0] gray,output [size-1:0] binary);
  parameter size=4;
  genvar i;
  generate 
    for(i=0;i<4;i++)
      assign binary[i]= ^(gray>>i);
  endgenerate
endmodule
//or
/*assign binary[3]=gray[3]^gray[2]^gray[1]^gray[0];
assign binary[2]=gray[3]^gray[2]^gray[1];
assign binary[1]=gray[3]^gray[2];
assign binary[0]=gray[3];*/
//dataflow modeling