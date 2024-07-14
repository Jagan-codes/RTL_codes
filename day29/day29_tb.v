module multiplier_tb;
  reg [3:0] a,b;
  wire [7:0] product;
   
  
  multiplier dut(a,b,product);
  initial begin
    $monitor("time=%0t a=%b b=%b product=%b ",$time,a,b,product);
    $dumpfile("multiplier.vcd");
    $dumpvars(1);
    
    a=4'b1010;b=4'b1011;
    #10;
    a=4'b1111;b=4'b1111;
    #10;
    a=4'b1100;b=4'b1101;
    #10;
    a=4'b1010;b=4'b1010;
    
    $finish;
  end
endmodule
    
    