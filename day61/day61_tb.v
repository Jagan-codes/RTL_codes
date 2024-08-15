module seven_segment_rom_tb;
  localparam addr_width=16;
  localparam addr_bits=4;
  localparam data_width=8;
  
  reg [addr_bits-1:0]addr;
  wire [data_width-1:0]data;
  
  seven_segment_rom DUT(addr,data);
  
  initial begin
    $monitor("time=%0t addr=%b data=%b",$time,addr,data);
    $dumpfile("seven_segment_rom.vcd");
    $dumpvars(1);
    
    addr=4'h0;
    #10;
    addr=4'h1;#10;
    addr=4'h2;#10;
    addr=4'h3;#10;
    addr=4'h4;#10;
    addr=4'h5;#10;
    addr=4'h6;#10;
    addr=4'h7;#10;
    addr=4'h8;#10;
    addr=4'h9;#10;
    addr=4'ha;#10;
    addr=4'hb;#10;
    addr=4'hc;#10;
    addr=4'hd;#10;
    addr=4'he;#10;
    addr=4'hf;#10;
    $finish;
  end
endmodule