module single_port_RAM_tb;
  
  localparam data_width=8;
  localparam add_width=8;
  reg [data_width-1:0]data;
  reg [add_width-1:0]addr;
  reg write_ena;
  reg clk;
  wire [data_width-1:0]q;
  
  single_port_RAM DUT(data,addr,write_ena,clk,q);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  
  initial begin
    $monitor("time=%0t data=%b write_enable=%b clk=%b q=%b",$time,data,write_ena,clk,q);
    $dumpfile("single_port_RAM.vcd");
    $dumpvars(1);
    
    data=8'd0;
    addr=8'b0;
    write_ena=0;
    #10;
    
    data=8'hAA;
    addr=8'h00;
    write_ena=1;
    #10;
    data=8'hbb;
    addr=8'h01;
    write_ena=1;
    #10;
    data=8'hcc;
    addr=8'h02;
    write_ena=1;
    #10;
    data=8'hdd;
    addr=8'h03;
    write_ena=1;
    #10;
    //read
    write_ena=0;
    
    addr=8'h00;
    
    #10;
    addr=8'h01;
    #10;
    addr=8'h02;
    #10;
    addr=8'h03;
    
    $finish;
  end
endmodule