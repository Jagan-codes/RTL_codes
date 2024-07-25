module SISO_shift_reg_tb;
  reg clk;
  reg reset;
  reg serial_in;
  wire serial_out;
  
  SISO_shift_reg DUT(clk,reset,serial_in,serial_out);
  
  initial begin
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b serial_in=%b Serial_out=%b",$time,clk,reset,serial_in,serial_out);
    $dumpfile("SISO_shift_reg.vcd");
    $dumpvars(1);
    clk=0;
    reset=1;
    #10;
    reset=0;
    #100;
    $finish;
  end
  
  initial begin
    repeat(10)
      begin
    	serial_in=$random();
        #5;
      end
  end
endmodule
    
    