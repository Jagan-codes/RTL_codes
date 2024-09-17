module amba_apb_tb;//apb master
  reg p_clk;
  reg p_reset;
  reg p_sel;
  reg [7:0]p_ad;
  reg p_wr;
  reg [31:0] p_wdata;
  reg p_ena;
  wire p_ready;
  wire [31:0] p_rdata;
  wire p_slverr;
  wire [1:0]next_state;
  
  amba_apb DUT(p_clk,p_reset,p_sel,p_ad,p_wr,p_wdata,p_ena,p_ready,p_rdata,p_slverr,next_state);
  
  initial begin
    p_clk=0;
    forever #5 p_clk=~p_clk;
  end
  
  initial begin
    $dumpfile("amba_apb.vcd");
    $dumpvars(1);
    init;
    res;
    r_w;
    #80;
    $finish;
  end
    
    task init;
      begin
        p_clk=0;
        p_reset=0;
        p_ad=0;
        p_sel=0;
        p_ena=0;
        p_wr=0;
      end
    endtask
    
    task res;
      begin
        p_reset=1;
        #10;
        p_reset=0;
      end
    endtask
    
    task ws; 
      begin
        @(posedge p_clk);
        p_wr = 1;
        p_sel = 1;
        p_wdata = $random %10; 
        p_ad =p_ad+1;
    
        @(posedge p_clk);
        p_ena = 1;
        p_sel=1;
    
        @(posedge p_clk);
        p_ena = 0;
        p_sel = 0;
    
        @(posedge p_clk); 
    
    $display("Write operation: p_wdata = %h, p_ad = %h", p_wdata, p_ad);
  end
endtask;

task rs;
  begin
    @(posedge p_clk);
    p_wr = 0;
    p_ena = 0;
    p_sel = 1;
    
    
    @(posedge p_clk);
    p_ad=p_ad+1;
    p_ena = 1;
    p_sel = 1;
     
    @(posedge p_clk); 
    p_sel=0;
    p_ena=0;
    
    $display("Read operation: p_rdata = %h, p_ad = %h", p_rdata, p_ad);
  end
endtask;

          
    task r_w;
      begin
        repeat(5)
          begin
          	ws;
          end
        
        #1;
        p_ad=0;
        repeat(5)
          begin
            rs;
          end
      end
    endtask
endmodule
     
        
          
          
        
      
    
    
    