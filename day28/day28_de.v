module LFSR(input clk,reset,output reg [3:0] op);
  always@(posedge clk)
    begin
      if(reset)
        op<=4'hf;
      else
        op<={op[2:0],op[2]^op[3]};
    end
endmodule

        