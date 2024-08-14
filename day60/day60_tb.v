module dual_ram_tb;
  localparam ADD_width=4;
  localparam DATA_width=8;
  localparam RAM_depth=1<<ADD_width;
  
  reg clk;
  
  reg [0:ADD_width-1]iaa;
  reg [0:DATA_width-1]ida;
  wire[0:DATA_width-1]oda;
  reg we_a;
  
  
  reg [0:ADD_width-1]iab;
  reg [0:DATA_width-1]idb;
  wire[0:DATA_width-1]odb;
  reg we_b;
  
  dual_ram DUT(clk,iaa,ida,oda,we_a,iab,idb,odb,we_b);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t iaa=%b ida=%b oda=%b we_a=%b iab=%b idb=%b odb=%b we_b=%b",$time,iaa,ida,oda,we_a,iab,idb,odb,we_b);
    $dumpfile("dual_ram.vcd");
    $dumpvars(1);
    iaa=4'd0;
    ida=8'd0;
    we_a=0;
    iab=4'd0;
    idb=8'd0;
    we_b=0;
    
    #10;
    //write in port a
    we_a=1;
    iaa=4'd5;
    ida=8'b10101010;
    #10;
    we_a=0;
    
    //wirte in port b
    we_b=1;
    iab=4'd0;
    idb=8'b01010101;
    #10;
    we_b=0;
    
    //read from port a
    iaa=4'd5;
    #10;
    
    //read from port b
    iab=4'd0;
    #10;
    
    iab=4'd1;//no data in the address 0001
    #10;
    
    //both read and write
    we_a=1;//write in port a
    iaa=4'd7;
    ida=8'b11110000;
    iab=4'd0;//read from port b
    #10;
    we_a=0;
    
    iaa=4'd7;//read from port a
    #10;
    
    $finish;
  end
endmodule
   