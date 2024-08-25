module lifo(
  input clk,
  input reset,
  input push,
  input pop,
  input [7:0]data,
  output reg[7:0]data_out,
  output reg empty,
  output reg full
);
  reg [7:0]stack [0:15];//depth of 16
  reg [3:0]s_p;//stack pointer
  always@(posedge clk)
    begin
    	if(reset)
          begin
          	s_p<=0;
            empty<=1;
            full<=0;
          end
        else 
          begin
            if(push&&!full)
              begin
                stack[s_p]<=data;
                s_p<=s_p+1;
              end
            else if(pop&&!empty)
              begin
                s_p<=s_p-1;
                data_out<=stack[s_p-1];
              end
            if(s_p==4'd0)
              begin
                empty<=1;
                full<=0;
              end
            else if(s_p==4'd16)
              begin
                empty<=0;
                full<=1;
              end
            else
              begin
                empty<=0;
                full<=0;
              end
                
          end
    end
endmodule