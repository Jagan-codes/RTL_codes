//testbench
module v_oper_tb;
  reg [3:0] a,b;
  wire [4:0] sum,diff;
  wire [7:0] prod;
  wire eq,gt,lt,and_res,or_res,parity;
  wire [3:0] rs,ls,bit_and,bit_or,bit_xor,bit_not;
  
  v_oper vut (.a(a),.b(b),.sum(sum),.diff(diff),.prod(prod),.eq(eq),.gt(gt),.lt(lt),.and_res(and_res),.or_res(or_res),.parity(parity),.rs(rs),.ls(ls),.bit_and(bit_and),.bit_or(bit_or),.bit_xor(bit_xor),.bit_not(bit_not));
  initial begin
    $monitor("time:%0t a=%b b=%b sum=%b diff=%b prod=%b eq=%d gt=%d lt=%d and_res=%d or_res=%d parity=%d rs=%b ls=%b bit_and=%b bit_or=%b bit_xor=%b bit_not=%b",$time,a,b,sum,diff,prod,eq,gt,lt,and_res,or_res,parity,rs,ls,bit_and,bit_or,bit_xor,bit_not);
    $dumpfile("dump.vcd");
    $dumpvars(1);
    a=4'b1111;b=4'b1111;#10;
    a=4'b1000;b=4'b1000;#10;
    a=4'b1001;b=4'b1001;#10;
    a=4'b0110;b=4'b0110;#10;
    a=4'b0101;b=4'b0101;#10;
    a=4'b1010;b=4'b1010;#10;
    $finish;
  end
endmodule