module universal_binary_counter(
  input [n-1:0] data,//data_in
  input clk,reset,syn_clr,en,up,load,
  output [n-1:0] q,
  output min,max);
  parameter n=8;
  reg [n-1:0] reg_next,r_reg;//register and next state
  
  //nextstate
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        r_reg=8'b0;
      else
        r_reg=reg_next;
    end
  
  //register
  
  always@(*)
    begin
      if(syn_clr)//synchronous clear
        reg_next=8'b0;
      else if(load)//load data
        reg_next=data;
      else if(en & up)//enable and upcount
        reg_next=r_reg+1;
      else if(en&~up)//enable and downcount
        reg_next=r_reg-1;
      else
        reg_next=r_reg;
    end
  assign q=r_reg;
  assign max=(reg_next==2**n-1)?1'b1:1'b0;
  assign min=(reg_next==0)?1'b1:1'b0;
endmodule
      
      
  
      