module dram(
  input clk,
  input reset,
  input read_r,
  input write_r,
  input [3:0]addr,
  input [7:0]data,
  output reg[7:0]read_data,
  output reg[1:0]curr_state
);
  
  reg [7:0] mem[15:0];//array
  //state
  parameter IDLE=2'b00;
  parameter READ=2'b01;
  parameter WRITE=2'b10;
  parameter REFRESH=2'b11;
  
  reg [1:0]next_state;
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        curr_state<=IDLE;
      else
        curr_state<=next_state;
    end
  
  always@(*)
    begin
      case(curr_state)
        IDLE:
          begin
            if(read_r)
              next_state<=READ;
            else if(write_r)
              next_state<=WRITE;
            else 
              next_state<=REFRESH;
          end
        READ:
          begin
          	next_state<=IDLE;
          end
        WRITE:
          begin
            next_state<=IDLE;
          end
        REFRESH:
          begin
            next_state<=IDLE;
          end
        default:
          next_state<=IDLE;
      endcase
    end
  always@(posedge clk)
    begin
      if(next_state==WRITE)
        mem[addr]<=data;
      else if(next_state==READ)
        read_data<=mem[addr];
    end
endmodule
        
            
        
        