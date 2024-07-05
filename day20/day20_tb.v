module gray_to_binary_tb;
  reg [3:0] gray,binary;
  
  gray_to_binary dut(gray,binary);
  initial begin
    $monitor("time=%0t gray=%b binary=%b ",$time,gray,binary);
    $dumpfile("gray_to_binary.vcd");
    $dumpvars(1);
    
    gray=4'h0;#2;
    gray=4'h1;#2;
    gray=4'h2;#2;
    gray=4'h3;#2;
    gray=4'h4;#2;
    gray=4'h5;#2;
    gray=4'h6;#2;
    gray=4'h7;#2;	
    gray=4'h8;#2;
    gray=4'h9;#2;
    gray=4'ha;#2;
    gray=4'hb;#2;
    gray=4'hc;#2;
    gray=4'hd;#2;
    gray=4'he;#2;
    gray=4'hf;#2;
    $finish;
  end
endmodule
    