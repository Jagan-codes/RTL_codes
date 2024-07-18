module n_bit_comparator_tb;
  reg [15:0] a,b;
  wire lesser,greater,equal;
  
  n_bit_comparator dut(.a(a),.b(b),.lesser(lesser),.greater(greater),.equal(equal));
  
  initial begin
    $monitor("time=%ot a=%d b=%d lesser=%b greater=%b equal=%b",$time,a,b ,lesser,greater,equal);
    $dumpfile("n_bit_comparator.vcd");
    $dumpvars(1);
  end
  initial begin
    a=32'd2;b=32'd2;
    #10;
    a=32'd44;b=32'd444;
    #10;
    a=32'd555;b=32'd888;
    #10;
    a=32'd8888;b=32'd8888;
    #10;
    a=32'd4545;b=32'd9999;
    #5;
    $finish;
  end
endmodule
    
    
  