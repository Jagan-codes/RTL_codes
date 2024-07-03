module comparator_tb;
  reg a,b;
  wire a_grt_b,a_les_b,a_eq_b;
  
  comparator dut(a,b,a_grt_b,a_les_b,a_eq_b);
  initial begin
    $monitor("time=%0t a=%b b=%b a_grt_b=%b a_les_b=%b a_eq_b=%b",$time,a,b,a_grt_b,a_les_b,a_eq_b);
    $dumpfile("comparator.vcd");
    $dumpvars(1);
    
    repeat(5)
      begin
        a=$random;b=$random;#1;
      end
  end
endmodule
    
  
 