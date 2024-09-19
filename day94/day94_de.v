
module uart(
  input [7:0]data,
  input tx_ena,
  input clk_50,
  output tx,
  output tx_busy,
  input rx,
  output ready,
  input ready_clr,
  output [7:0] data_out
);
  wire txclk_ena,rxclk_ena;
  
  //instatiation of baud rate
  brate uart_b(.clk_50(clk_50),.rxclk_ena(rxclk_ena),.txclk_ena(txclk_ena));
  
  //instatiation of transmitter
  
  uart_tx transmitter(.clk_50(clk_50),.tx_ena(tx_ena),.data(data),.clk_ena(tx_clk_ena),.tx(tx),.tx_busy(tx_busy));
  
  //instatiation of receiver
  
  uart_rx receiver(.rx(rx),.ready(ready),.ready_clr(ready_clr),.clk_50(clk_50),.clk_ena(clk_ena),.data(data));
endmodule
          
          
  
  
  
module uart_tx(
  input clk_50,//50 mhz clk freq
  input tx_ena,
  input [7:0]data,
  input clk_ena,//clock enable
  output reg tx,
  output tx_busy//transmiiter is busy
);
  
  parameter [1:0]IDLE=2'b00,
                 START=2'b01,
                 TRANSMIT=2'b10,
                 STOP=2'b11;
  
  reg [7:0] shift_reg=8'd0;//act as buffer to store and communicate serially
  reg [2:0] bit_in=3'd0;//bit index
  reg [1:0] state=IDLE;//initial state;
  
  
  initial begin
    tx=1'b1;
  end
  
  always@(posedge clk_50)
    begin     
      case(state)
        IDLE:
          begin
            if(tx_ena)
              begin
                state<=START;
                shift_reg<=data;
                bit_in=3'd0;
              end
          end
        
        START:
          begin
            if(clk_ena)
              begin
                tx<=1'b0;//ready to transmit
                state<=TRANSMIT;
              end
          end
        
        TRANSMIT:
          begin
            if(clk_ena)
              begin
                if (bit_in==3'd7)
                  state<=STOP;
                else
                  bit_in=bit_in+3'h1;
                tx<=shift_reg[bit_in];
              end
          end
        
        STOP:
          begin
            if(clk_ena)
              begin
                tx<=1'b1;
                state<=IDLE;
              end
          end
        
        default:
          begin
            tx<=1'b1;
            state<=IDLE;
          end
        
      endcase
    end
  assign tx_busy=(state!=IDLE);
endmodule

module uart_rx(
  input rx,
  output reg ready,
  input ready_clr,
  input clk_50,
  input clk_ena,
  output reg [7:0]data//output receiver
);
  parameter [1:0] START=2'b00,
                  RECEIVE=2'b01,
                  STOP=2'b10;
  

  reg [1:0] state=START;
  reg [3:0]sample=0;//sample counter
  reg [3:0] bit_in=0;
  reg [7:0] shift_reg=8'b0;//temporary stores the data
  
  initial begin
    ready=0;
    data=8'b0;
  end
    
  
  always@(posedge clk_50)
    begin
      if(ready_clr)
        ready<=0;
      if(clk_ena)
        begin
          case(state)
            START:
              begin
                if(!rx||sample!=0)
                  sample<=sample+4'b1;
                if(sample==15)
                  begin
                    state<=RECEIVE;
                    bit_in<=0;
                    sample<=0;
                    shift_reg<=0;
                  end
              end
            
            RECEIVE:
              begin
                sample<=sample+4'b1;
                if(sample==4'h8)
                  begin
                    shift_reg[bit_in[2:0]]<=rx;
                    bit_in<=bit_in+1;
                  end
                if(bit_in==8&&sample==15)
                  state<=STOP;//stop the communication
              end
            
            STOP:
              begin
                if(sample==15||(sample>=8 && !rx))
                   begin
                     state<=START;
                     data<=shift_reg;
                     ready<=1'b1;
                     sample<=0;
                   end
                 else
                   sample<=sample+4'b1;
              end
            
            default:
              begin
                state<=START;
              end
          endcase
        end
    end
endmodule
module brate(
  input clk_50,
  output rxclk_ena,
  output txclk_ena
);
  parameter rx_max=50000000/(115200*16),
            tx_max=50000000/115200;
  
  parameter rx_width= $clog2(rx_max);
  parameter tx_width= $clog2(tx_max);
  
  reg[rx_width-1:0] rx_acc=0;
  reg [tx_width-1:0] tx_acc=0;
  
  
  assign rxclk_ena=(rx_acc==5'd0);
  assign txclk_ena=(tx_acc==9'd0);
  
  always@(posedge clk_50)
    begin
      if(rx_acc==rx_max[rx_width-1:0])
        rx_acc<=0;
      else
        rx_acc<=rx_acc+5'b1;
    end
  
  always@(posedge clk_50)
    begin
      if(tx_acc==tx_max[tx_width-1:0])
        tx_acc<=0;
      else
        tx_acc<=tx_acc+9'b1;
    end
endmodule
