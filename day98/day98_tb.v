module spi_top_tb;
  parameter clk_freq=50000000,//50 mhz
            spi_freq=5000000,
            data_width=8,
            cpol=1,//clk polarity
            cpha=1;//clk phase
    reg clk;
    reg rst;
    reg [data_width-1:0] data_m_in;
    reg [data_width-1:0] data_s_in;
    reg start;
    wire finish;
    wire [data_width-1:0] data_m_out;
    wire [data_width-1:0]data_s_out;
    wire data_valid_s;
    wire data_valid_pos;

  spi_top #(
    clk_freq,spi_freq,data_width,cpol,cpha)  um(clk,rst,data_m_in,data_s_in,start,finish,data_m_out,data_s_out,data_valid_s);
  
  initial begin
    clk=1;
    forever #10 clk=~clk;
  end 
  
  initial begin
    rst=1;
    #22 rst=0;
  end 
  
  initial fork
		data_m_in_ge;//data master in generate
		data_s_in_ge;//data slave in
		start_change;
  join
  
 task data_m_in_ge;
    begin
      data_m_in='d0;
      @(posedge ~rst)
      data_m_in<=8'b10100101;
      @(posedge finish)
      data_m_in<=8'b10011010;
    end
  endtask
  
  task data_s_in_ge;
    begin
      data_s_in='d0;
      @(posedge ~rst)
      data_s_in<=$random;
      @(negedge finish)
      data_s_in<=$random;
      @(negedge data_valid_s)
      ;
      @(negedge data_valid_s)
      #20 $finish;
    end
  endtask
  
  task start_change;
    begin
      start=0;
      @(posedge rst)
      #20 start<=1;
      #20 start=0;
      @(negedge finish)
      #20 start=1;
      #20 start=0;
    end
  endtask
  
  initial begin
    $dumpfile("spi_top.vcd");
    $dumpvars();
  end
  
  reg data_valid_1;
  reg data_valid_2;
  
  always@(posedge clk,negedge rst)
    begin
      data_valid_1<=data_valid_s;
      data_valid_2<=data_valid_1;
    end
  assign data_valid_pos=~data_valid_2&data_valid_1;
  always@(posedge clk)
    begin
      if(data_valid_pos)
        if(data_s_out==data_m_in)
          $display("successfully  transmitted data_s_out=%b data_m_in=%b",data_s_out,data_m_in);
        else
          $display("failed data_s_out=%b data_m_in=%b",data_s_out,data_m_in);
    end
  
  always@(posedge clk)
    begin
      if(data_valid_pos)
        if(data_m_out==data_s_in)
          $display("successfully  transmitted data_m_out=%b data_s_in=%b",data_m_out,data_s_in);
        else
          $display("failed data_m_out=%b data_s_in=%b",data_m_out,data_s_in);
    end
  
  initial begin
    $display("time=%0t data_valid_s=%b data_valid_pos=%b data_s_out=%b data_m_in=%b", $time, data_valid_s, data_valid_pos, data_s_out, data_m_in);
  end
  
endmodule

module spi_master_tb;
    parameter clk_freq=50000000,//50 mhz
            spi_freq=5000000,
            data_width=8,
            cpol=1,//clk polarity
            cpha=1;//clk phase
  
  reg clk;
  reg rst;
  reg [data_width-1:0]data_in;
  reg start;
  reg miso;
  
  wire sclk;
  wire cs;
  wire mosi;
  wire finish;
  wire [data_width-1:0] data_out;
  
  
  spi_master #(clk_freq,spi_freq,data_width,cpol,cpha)
  u_m(clk,rst,data_in,start,miso,sclk,cs,mosi,finish,data_out);  
  initial begin
    clk=1;
    forever #10 clk=~clk;
  end 
  
  initial begin
    rst=1;
    #22 rst=0;
  end 
  
  initial fork
		data_in_ge;//data in generate
		s_c;//start change
		debug_i;//debug information
  join
  
 task data_in_ge;
    begin
      data_in=0;
      @(posedge ~rst)
      data_in<=8'b11111111;
      @(posedge finish)
      data_in<=8'b10011010;
      @(negedge finish)
      @(negedge finish)
      #20;
      $finish;
    end
  endtask
  
  task s_c;
    begin
      start=0;
      @(posedge ~rst)
      #20 start<=1;
      #20 start<=0;
      @(negedge finish)
      #20 start<=1;
      #20 start<=0;
    end
  endtask
  task debug_i;
    begin
      $monitor("time=%0t mosi=%b miso=%b data_in=%b",$time,mosi,miso,data_in);
    end
  endtask
  
  generate 
    if(cpha==0)
      always@(negedge sclk)
        miso=$random;
    else
      always@(posedge sclk)
        miso=$random;
  endgenerate
  
  initial begin 
    $dumpfile("spi_vcd");
    $dumpvars(1);
  end 
endmodule