module barrel_shifter_tb;
  reg [3:0] data;
  reg [1:0] shift_amt;
  reg dir;
  wire [3:0] shifted_output;
  
  barrel_shifter dut(data,shift_amt,dir,shifted_output);
  
  initial begin
    $monitor("time=%0t data=%b shift amount=%b dir=%b shifted output=%b",$time,data,shift_amt,dir,shifted_output);
    $dumpfile("barrel_shiter.vcd");
    $dumpvars(1);
    
    //data input 
    data=4'b1111;#4;
    data=4'b1010;#4;
    data=4'b1110;#4;
    data=4'b1100;#4;
  end
    
    //shift amount
  initial begin
    repeat(4)
      begin
        shift_amt=2'b00;#1;
        shift_amt=2'b01;#1;
        shift_amt=2'b10;#1;
        shift_amt=2'b11;#1;
      end
    
    
  end
    
    //direction
  initial begin
    dir=0;#4;
    dir=1;#4;
    dir=0;#4;
    dir=1;#4;
    
   
  end
endmodule