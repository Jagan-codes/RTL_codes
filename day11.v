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
//testbench
module J_K_flipflop_tb;
  reg j,k,clk,reset;
  wire q;
  j_k_flipflop uut(.j(j),.k(k),.clk(clk),.q(q),.reset(reset));
  initial begin
    $monitor("time=%0t clk=%b j=%b k=%b q=%b",$time,clk,j,k,q);
    $dumpfile("dump.vcd");
    $dumpvars(1);
    clk=0;
    reset=0;#70;
    reset=1;#10;
  end
    initial begin
      j=0;k=0;#10;
      j=0;k=1;#10;
      j=1;k=0;#10;
      j=1;k=1;#10;
    	#50;
      $finish;
    end
  always #5 clk=~clk;
endmodule