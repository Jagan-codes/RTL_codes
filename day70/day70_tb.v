module fifo_tn;
  localparam depth=16,width=8;
  reg [width-1:0]data;
  reg wr_ena;
  reg rd_ena,clk,reset;
  wire [width-1:0]data_out;
  wire empty;
  wire full;
  
  fifo DUT(data,wr_ena,rd_ena,clk,reset,data_out,empty,full);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t data=%b wr_ena=%b rd_ena=%b clk=%b reset=%b data_out=%b empty=%b full=%b",$time,data, wr_ena,rd_ena,clk,reset,data_out,empty,full);
    $dumpfile("fifo.vcd");
    $dumpvars(1);
    
    reset=1;
    wr_ena=0;
    rd_ena=0;
    data=0;
    
    #10;
    reset=0;
    wr_ena=1;
    data=8'd45;#10;
    wr_ena=1;data=8'd18;#10;
    wr_ena=1;data=8'd73;#10;
    wr_ena=1;data=8'd36;#10;
    wr_ena=1;data=8'd27;#10;
    wr_ena=1;data=8'd57;#10;
    wr_ena=1;data=8'd17;#10;
    wr_ena=0;
    #10;
    rd_ena=1;
    #80;
    rd_ena=0;
    $finish;
  end
endmodule
    
    