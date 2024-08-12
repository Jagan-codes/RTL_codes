module Fixed_priority_arbiter_tb;
  reg [3:0]req;
  wire [3:0]gnt;
  
  
  Fixed_priority_arbiter DUT(.req(req),.gnt(gnt));
  initial begin
    $monitor("time=%0t req=%b gnt=%b",$time,req,gnt);
    $dumpfile("Fixed_priority_arbiter.vcd");
    $dumpvars(1);
    
    req=4'b0000;
    #10;
    req=4'd1;
    #10;
    req=4'd2;
    #10;
    req=4'd3;
    #10;
    req=4'd6;//default
    #10;
    req=4'd8;
    #10;
    req=4'd4;
    #10;
    
    
    $finish;
  end
endmodule