module universal_shift_register(
  input clk,reset,
  input [1:0] select,//selection
  input [3:0] pdin,//parallel in
  input  l_in,//left in
  input r_in,//right in
  output reg [3:0] pdout,//output 
  output l_s_out,//left shift output
  output r_s_out);//ight shift output
  
  always@(posedge clk)
    begin
      if(reset)
        pdout<=0;
      else
        case(select)
          2'h0:pdout<={r_in,pdout[3:1]};//right shifted output
          2'h1:pdout<={pdout[2:0],l_in};//left shifted o/p
          2'h2:pdout<=pdin;//parallel output \
        endcase
    end
  assign l_s_out=pdin[0];
  assign r_s_out=pdin[3];
endmodule
                       
  
  