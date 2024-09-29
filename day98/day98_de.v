module spi_top #(
  parameter clk_freq=50000000,//50 mhz
            spi_freq=5000000,
            data_width=8,
            cpol=1,//clk polarity
            cpha=1//clk phase
 )(
  input clk,
  input rst,
  input[data_width-1:0]data_m_in,//master_in
  input [data_width-1:0] data_s_in,//slave in
  input s_m,//master starts
  output f_m,//finish master
  output [data_width-1:0] data_m_out,
  output [data_width-1:0] data_s_out,
  output data_valid_s
);
  
  wire miso;//master in slave out
  wire mosi;//master out slave in
  wire cs;//chip select or slave select
  wire sclk;//synchronousized_clk
  
  //instantiation of master 
  spi_master#(
   clk_freq,spi_freq,data_width,cpol,cpha)
  master(clk,rst,data_m_in,s_m,miso,sclk,cs,mosi,f_m,data_m_out);
  
  //intatiation of slave
  
  spi_slave #(
 clk_freq,spi_freq,data_width,cpol,cpha)
  slave(clk,rst,data_s_in,sclk,cs,mosi,miso,data_valid_s,data_s_out);
endmodule

module spi_master#(
  parameter clk_freq=50000000,//50 mhz
            spi_freq=5000000,
            data_width=8,
            cpol=0,//clk polarity
            cpha=0//clk phase
)
  (
    input clk,
    input rst,
    input [data_width-1:0] data_in,
    input start,
    input miso,
    output reg sclk,
    output reg cs,
    output mosi,
    output reg finish,
    output reg [data_width-1:0] data_out
  );
  
  localparam 
  freq_cnt=clk_freq/spi_freq-1,
  shift_width=log2(data_width),
  cnt_width=log2(freq_cnt);
  
  localparam
  IDLE=3'b000,
  LOAD=3'b001,
  SHIFT=3'b010,
  DONE=3'b100;
  
  reg [2:0]curr_state;
  reg [2:0] next_state;
  reg clk_cnt_en;
  reg sclk_a;
  reg sclk_b;
  reg [cnt_width-1:0] clk_cnt;
  reg [shift_width-1:0]shift_cnt;
  reg [data_width-1:0] data_reg;
  
  wire sclk_posedge;
  wire sclk_negedge;
  wire shift_en;
  wire sample_en;
  
  always@(posedge clk,posedge rst)
    begin
      if(rst)
        clk_cnt<=0;
      else if(clk_cnt_en)
        begin
          if(clk_cnt==freq_cnt)
            clk_cnt<=0;
          else
            clk_cnt<=clk_cnt+1;
        end
      else
        clk_cnt<=0;
    end
  
  always@(posedge clk,posedge rst)
    begin
      if(rst)
        sclk<=cpol;
      else if(clk_cnt_en)
        begin
          if(clk_cnt==freq_cnt)
            sclk<=~sclk;
          else
            sclk<=sclk;
        end
      else
        sclk<=cpol;
    end
  
  always@(posedge clk, posedge rst)
    begin
      if(rst)
        begin
          sclk_a<=cpol;
          sclk_b<=cpol;
        end
      else if(clk_cnt_en)
        begin
          sclk_a<=sclk;
          sclk_b<=sclk_a;
        end
    end
  
  assign sclk_posedge =~sclk_b&sclk_a;
  assign sclk_negedge =~sclk_a&sclk_b;
  
  generate
    case(cpha)
      0:
        assign sample_en=sclk_posedge;
      1:
        assign sample_en=sclk_negedge;
      default:
        assign sample_en=sclk_posedge;
    endcase
  endgenerate
  
  generate
    case(cpha)
      0:
        assign shift_en=sclk_negedge;
      1:
        assign shift_en=sclk_posedge;
      default:
        assign shift_en=sclk_posedge;
    endcase
  endgenerate
  
  always@(posedge clk,posedge rst)
    begin
      if(rst)
      	curr_state<=IDLE;
      else
        curr_state<=next_state;
    end
  always@(*)
    begin
      case(curr_state)
        IDLE:next_state=start?LOAD:IDLE;
        LOAD:next_state=SHIFT;
        SHIFT:next_state=(shift_cnt==data_width)?DONE:SHIFT;
        DONE:next_state=IDLE;
        default:
          next_state=IDLE;
      endcase
    end
  
  always@(posedge clk,posedge rst)
    begin
      if(rst)
        begin
          clk_cnt_en<=0;
          data_reg<=0;
          cs<=1;
          shift_cnt<=0;
          finish<=0;
        end
      else 
        begin
          case(next_state)
            IDLE:
              begin
                clk_cnt_en<=0;
                data_reg<=0;
                cs<=1;
                shift_cnt<=0;
                finish<=0;
              end
            LOAD:
              begin
                clk_cnt_en<=1;
                data_reg<=data_in;
                cs<=0;
                shift_cnt<=0;
                finish<=0;
              end
            SHIFT:
              begin
                if(shift_en)
                  begin
                    shift_cnt<=shift_cnt+1;
                    data_reg<={data_reg[data_width-2:0],1'b0};
                  end
                else 
                  begin
                    shift_cnt<=shift_cnt;
                    data_reg<=data_reg;
                  end
                clk_cnt_en<=1;
                cs<=0;
                finish<=0;
              end
            
            DONE:
              begin
                clk_cnt_en<=0;
                data_reg<=0;
                cs<=1;
                shift_cnt<=0;
                finish<=1;
              end
            
            default:
              begin
                 clk_cnt_en<=0;
                 data_reg<=0;
                 cs<=1;
                 shift_cnt<=0;
                 finish<=0;
              end
          endcase
        end
    end
  
  assign mosi=data_reg[data_width-1];
  
  always@(posedge clk,posedge rst)
    begin
      if(rst)
        data_out<=0;
      else if(sample_en)
        data_out<={data_out[data_width-1:0],miso};
      else
        data_out<=data_out;
    end
  
  function integer log2(input integer v);
    begin
      log2=0;
      while(v>>log2)
        log2=log2+1;
    end
  endfunction
endmodule

module spi_slave#(
  parameter clk_freq=50000000,//50 mhz
            spi_freq=5000000,
            data_width=8,
            cpol=1,//clk polarity
  cpha=1//clk phase
)(
  input clk,
  input rst,
  input [data_width-1:0] data_in,
  input sclk,
  input cs,
  input mosi,
  output miso,
  output data_valid,
  output reg [data_width-1:0] data_out
);
  
  localparam shift_num=log2(data_width);
  
  reg [data_width-1:0] data_reg;
  reg[shift_num-1:0] sample_num;
  reg sclk_a;
  reg sclk_b;
  
  wire sclk_posedge;
  wire sclk_negedge;
  
  reg cs_a;
  reg cs_b;
  
  wire cs_negedge;
  wire shift_en;
  wire sample_en;
  
  always@(posedge clk,posedge rst)
    begin
      if(rst)
        begin
          sclk_a<=cpol;
          sclk_b<=cpol;
        end
      else if(!cs)
        begin
          sclk_a<=sclk;
          sclk_b<=sclk_a;
        end
    end
  assign sclk_posedge =~sclk_b&sclk_a;
  assign sclk_negedge =!sclk_b;
  
  always@(posedge clk,posedge rst)
    begin
      if(rst)
        begin
          cs_a<=1;
          cs_b<=1;
        end
      else 
        begin
          cs_a=cs;
          cs_b<=cs_a;
        end
    end
  
  assign cs_negedge=~cs_a&cs_b;
  
  generate
    case(cpha)
      0:
        assign sample_en=sclk_posedge;
      1:
        assign sample_en=sclk_negedge;
      default:
        assign sample_en=sclk_posedge;
    endcase
  endgenerate
  
  generate
    case(cpha)
      0:
        assign shift_en=sclk_negedge;
      1:
        assign shift_en=sclk_posedge;
      default:
        assign shift_en=sclk_posedge;
    endcase
  endgenerate
  
  always@(posedge clk,posedge rst)
    begin
      if(rst)
        data_reg<=0;
      else if(cs_negedge)
        data_reg=data_in;
      else if(!cs&shift_en)
        data_reg<=data_reg;
    end
  assign miso=!cs?data_reg[data_width-1]:0;
  
  always@(posedge clk,posedge rst)
    begin
      if(rst)
        data_out<=0;
      else if(!cs&sample_en)
        data_out<={data_out[data_width-2:0],mosi};
      else
        data_out<=data_out;
    end
  
  always@(posedge clk,posedge rst)
    begin
      if(rst)
        sample_num<=0;
      else if(cs)
        sample_num<=0;
      else if(!cs&sample_en)
        if(sample_num==data_width)
          sample_num<=1;
        else
          sample_num<=sample_num;
    end
  
  assign data_valid=sample_num==data_width;
  
  function integer log2(input integer v);
  begin
    log2=0;
    while(v>>log2)
      log2=log2+1;
  end
  endfunction
endmodule