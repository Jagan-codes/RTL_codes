module dual_ram #(
  parameter ADD_width=4,
  parameter DATA_width=8,
  parameter RAM_depth=1<<ADD_width)(
  input clk,
  //for port a 
  input [0:ADD_width-1]iaa,//address of a
  input [0:DATA_width-1]ida,//data of a
  output reg [0:DATA_width-1]oda,
  input we_a,//write enable for port a
  //port b
  
  input [0:ADD_width-1]iab,//address of b
  input [0:DATA_width-1]idb,//data of b
  output reg [0:DATA_width-1]odb,
  input we_b
);
  
  reg [0:DATA_width-1] RAM [0:RAM_depth-1];
  //port a
  always@(posedge clk)
    begin
      if(we_a)
        begin
        	RAM[iaa]<=ida;
        end
      oda<=RAM[iaa];  
    end
  //port b
  always@(posedge clk)
    begin
      if(we_b)
        begin
          RAM[iab]<=idb;
        end
      odb<=RAM[iab];
    end
endmodule