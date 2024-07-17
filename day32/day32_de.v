module binary_to_one_hot_encoder( onehotout,bin);
   
  parameter m=4;
  parameter n=16;
  input [m-1:0] bin;
  output reg [n-1:0] onehotout;
  
  assign onehotout=1'b1<<bin;//dataflow model
endmodule
/*module binary_to_one-hot_encoder( input [3:0] bin,output [7:0] onehotout);
  always@(bin)
    begin
      onehotout=8'b0;//behaviour modeling
      case(bin)
        3'd0: onehotout=8'd0;
        3'd1: onehotout=8'b1;
        3'd2: onehotout=8'b2;
        3'd3: onehotout=8'b3;
        3'd4: onehotout=8'b4;
        3'd5: onehotout=8'b5;
        3'd6: onehotout=8'b6;
        3'd7: onehotout=8'b7;
        3'd8: onehotout=8'b8;
      endcase
     end
 endmodule*/
        
  
 