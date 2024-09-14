module apb_sram_tb;
  localparam DATA_WIDTH=32;
  localparam ADDR_WIDTH=10;
  
  reg Pclk;
  reg Psel;
  reg Pena;
  reg Pwrite;
  reg [ADDR_WIDTH-1:0]Paddr;
  reg [DATA_WIDTH-1:0]Pwdata;
  reg [DATA_WIDTH-1:0] s_rdata;
  wire [DATA_WIDTH-1:0]Prdata;
  wire Pready;
  wire Perr;
  wire [ADDR_WIDTH-1:0] s_address;
  wire [DATA_WIDTH-1:0] s_wdata;
  wire s_wena;
  wire s_cena;
  
  
  apb_sram DUT(Pclk,Psel,Pena,Pwrite,Paddr,Pwdata,s_rdata,Prdata,Pready,Perr,s_address,s_wdata,s_wena,s_cena);
  
  simple_sram DET( .clk(Pclk),.address(Paddr),.din(Pwdata),.wena(s_wena),.cena(s_cena),.dout(s_rdata));
  
  initial begin
    Pclk=0;
    forever  #5 Pclk=~Pclk;
  end
  
  initial begin
    $monitor("time=%0t Pclk=%b Psel=%b Pena=%b Pwrite=%b Paddr=%b Pwdata=%b s_rdata=%b Prdata=%b Pready=%b Perr=%b s_address=%b s_wdata=%b s_wena=%b s_cena=%b",$time,Pclk,Psel,Pena,Pwrite,Paddr,Pwdata,s_rdata,Prdata,Pready,Perr,s_address,s_wdata,s_wena,s_cena);
    $dumpfile("apb_sram.vcd");
    $dumpvars(1);
    
    Pclk=0;
    Psel=0;
    Pena=0;
    Pwrite=0;
    Paddr=0;
    Pwdata=0;
    
    #10;
    Psel=1;
    Pena=1;
    Pwrite=1;
    Paddr=10'd5;
    Pwdata=32'hFFFF_FFFF;
    
    #10;
    Psel=0;
    Pena=0;
    
    #10;
    Psel=1;
    Pena=1;
    Pwrite=1;
    Paddr=10'd10;
    Pwdata=32'hCCDD_AABB;
    
    #10;
    Psel=0;
    Pena=0;
    
    #10;
    Psel=1;
    Pena=1;
    Pwrite=0;//read
    Paddr=10'd10;
    
    #10;
    Psel=0;
    Pena=0;
    
    #10;
    Psel=1;
    Pena=1;
    Pwrite=0;//read
    Paddr=10'd5;
    
    
    #10;
    Psel=0;
    Pena=0;  
    
    #10;
    Psel=1;
    Pena=1;
    Pwrite=0;
    Paddr=10'd5;
    #10;
    
    $finish;
  end
endmodule
                  
    
  
  