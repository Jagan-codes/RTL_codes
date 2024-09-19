

module uart_TB;

  reg [7:0]data[2:0];
    reg clk;                
    reg enable;              
    reg Rx_en;          
    reg[1:0]data_index;   
    reg rst;               
    wire Tx_busy;    
    wire ready;
    wire [7:0] Rx_data; 

    wire loopback;
    reg ready_clr=0;     

    uart_c test_uart(
      .data(data[data_index]),.tx_ena(enable),.clk_50(clk),.rst(rst),.tx(loopback),.tx_busy(Tx_busy),.rx(loopback),.ready(ready),.ready_clr(ready_clr),.rx_ena(Rx_en),.data_out(Rx_data),.LED(),.tx2());

    always begin
        #1clk=~clk;
    end

    initial begin
       
      data[0]<=8'hff; 
      data[1]<=8'hbb;
      data[1]<=8'hdd;

        clk=0;
        rst=1;       
        enable=0;  
        Rx_en=0;
        data_index=0; 
        
        $dumpfile("uart.vcd");  
        $dumpvars(0,uart_TB);  

        #5 rst=0;
        repeat (3) begin
            enable<=1'b1; 
            Rx_en<=1'b1;   
            #2 enable<=1'b0;  
            #2 Rx_en<=1'b0; 
          
           @(posedge ready);  
          
            if (Rx_data != data[data_index]) begin
                $display("FAIL: rx data %x does not match tx %x", Rx_data, data[data_index]);
            end else begin  
                $display("SUCCESS: all bytes verified data=%b rx_data=%b", data[data_index], Rx_data);
            end

            #2 ready_clr<=1;  
            #2 ready_clr<=0;  
            data_index=data_index+1;
        end
        $finish;
    end
endmodule
/* console output
VCD info: dumpfile uart.vcd opened for output.
SUCCESS: all bytes verified data=11111111 rx_data=11111111
*/