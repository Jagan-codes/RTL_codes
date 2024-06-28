  //testbench
module logic_gates_tb;
  reg a,b;
  wire and_out,or_out,not_out,nand_out,nor_out,xor_out,xnor_out;
  logic_gates uut(.a(a),.b(b),.and_out(and_out),.or_out(or_out),.not_out(not_out),.nand_out(nand_out),.nor_out(nor_out),.xor_out(xor_out),.xnor_out(xnor_out));
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
    $monitor("time:%0t a=%b b=%b and_out=%b or_out=%b not_out=%b nand_out=%b nor_out=%b xor_out=%b xnor_out=%b",$time,a,b,and_out,or_out,not_out,nand_out,nor_out,xor_out,xnor_out);
  
    a=0;b=0;#10;
    a=0;b=1;#10;
    a=1;b=0;#10;
    a=1;b=1;#10;
    $finish;
  end
endmodule