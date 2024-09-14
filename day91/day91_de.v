module apb_sram#(parameter DATA_WIDTH=32,
                 parameter ADDRESS_WIDTH=10)(
  input Pclk,
  input Psel,
  input Pena,
  input Pwrite,
  input [ADDRESS_WIDTH-1:0] Paddr,//address
  input [DATA_WIDTH-1:0]Pwdata,//write data
  input [DATA_WIDTH-1:0]S_rdata,
  output reg [DATA_WIDTH-1:0] Prdata,//read data
  output reg Pready,
  output reg Perr,// indicates error 
  output reg[ADDRESS_WIDTH-1:0]s_address,
  output reg [DATA_WIDTH-1:0]s_wdata,//write data in sram
  output reg  s_wena,//write enable
  output reg s_cena);
  
  always@(posedge Pclk)
    begin
      if(Psel&&Pena)
        begin
          Pready<=1;
          Perr<=0;
          
          if(Pwrite)
            begin
              s_address<=Paddr;
              s_wdata<=Pwdata;
              s_wena<=1;
              s_cena<=0;
            end
          else
            begin
              s_address<=Paddr;
              s_wena<=0;
              s_cena<=0;
              Prdata<=S_rdata;
            end
        end
      else
        begin
          Pready<=0;
          Perr<=0;
          s_wena<=0;
          s_cena<=1;
        end
    end
endmodule


module simple_sram #(
  parameter DATA_WIDTH=32,
  parameter ADDR_WIDTH=10)
  (
  input clk,
  input [ADDR_WIDTH-1:0]address,
  input [DATA_WIDTH-1:0]din,
  input wena,
  input cena,
  output reg [DATA_WIDTH-1:0] dout
);
  
  
  reg [DATA_WIDTH-1:0] memory [0:2**ADDR_WIDTH-1];
  always@(posedge clk)
    begin
      if(~cena)
        begin
          if(wena)
            memory[address]<=din;
          else
            dout<=memory[address];
        end
    end
endmodule
                     
 
  