module single_port_RAM #(parameter data_width=8,parameter add_width=8)(
  input [data_width-1:0]data,//data
  input [add_width-1:0] addr,//address
  input write_ena,
  input clk,
  output reg [data_width-1:0] q//output
);
  
  reg [data_width-1:0] ram[2**add_width-1:0];
  reg [add_width-1:0] addr_reg;
  
  always@(posedge clk)
    begin
      if(write_ena)
        begin
          ram[addr]<=data;//write
        end
      else
        begin
          addr_reg<=addr;
        end
      q<=ram[addr];//read
    end
endmodule