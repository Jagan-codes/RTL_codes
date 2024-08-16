module dram_tb;
  reg clk;
  reg reset;
  reg read_r;
  reg write_r;
  reg [3:0]addr;
  reg [7:0]data;
  wire [7:0]read_data;
  wire [1:0]curr_state;
  
  dram DUT(clk,reset,read_r,write_r,addr,data,read_data,curr_state);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b read_request=%b write_request=%b addr=%b data=%b read_data=%b curr_state=%b",$time,clk,reset,read_r,write_r,addr,data,read_data,curr_state);
    $dumpfile("dram.vcd");
    $dumpvars(1);
    reset=1;
    read_r=0;
    write_r=0;
    addr=4'd0;
    data=8'd0;
    #10;
    
    reset=0;
    read_r=0;
    write_r=1;
    addr=4'd1;
    data=8'b10101010;
    #10;
    write_r=0;
    #10;
    read_r=1;
    addr=4'd1;
    
    #10;
    reset=0;
    read_r=0;
    write_r=1;
    addr=4'd2;
    data=8'b01010101;
    #10;
    write_r=0;
    #10;
    read_r=1;
    addr=4'd2;
    
    #10;
    $finish;
  end
endmodule
    
    
    
    
    
  