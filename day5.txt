//designmodule mod_por(input [1:0] sel,input [31:0] in0,in1,in2,in3, output reg [31:0] out);
  always@(*)
    begin
      case(sel)
          2'b00: out=in0;
          2'b01: out=in1;
          2'b10: out=in2;
          2'b11: out=in3;
          default: out =32'h00000000;
       endcase
    end
     
 endmodule
      
      
  

  
  //testbench
  module mod_por_tb;
  reg [1:0] sel;
  reg [31:0] in0,in1,in2,in3;
  wire [31:0] out;
  
  mod_por uut(.sel(sel),.in0(in0),.in1(in1),.in2(in2),.in3(in3),.out(out));
  initial begin
    in0=32'hAAAA_AAAA;
    in1=32'hBBBB_BBBB;
    in2=32'hCCCC_CCCC;
    in3=32'hDDDD_DDDD;
    #10;
   
    
    $monitor("time:%0t sel=%b in0=%h in1=%h in2=%h in3=%h out=%h",$time,sel,in0,in1,in2,in3,out);
    $dumpfile("dump.vcd");
    $dumpvars(1);
    sel=2'b00;
    #10;
    sel=2'b01;
    #10;
    sel=2'b10;
    #10;
    sel=2'b11;
    #10
    $finish;
    
  end
endmodule
             
  
                  
                  
                