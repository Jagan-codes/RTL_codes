//design//flipflop
module j_k_flipflop(input j,k,clk,reset,output reg q);
  always@(posedge clk)//synchronous block
    begin
      if(reset)
        begin
          q<=0;
        end
      else begin
        case({j,k})
          2'b00:q<=q;//nochange
          2'b01:q<=0;//reset
          2'b10:q<=1;//set
          2'b11:q<=~q;//toggle
        endcase
      end
    end
endmodule
