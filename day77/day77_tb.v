module elevator_control_tb;
  reg clk;
  reg reset;
  reg [1:0]floor_request;
  wire door_open;
  wire [1:0]current_floor;
  wire moving_up;
  wire moving_down;
  
  elevator_control DUT(clk,reset,floor_request,door_open,current_floor,moving_up,moving_down);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%ot clk=%b reset=%b floor_request=%b door_open=%b current_foor=%b moving_up=%b moving_down=%b",$time,clk,reset,floor_request,door_open,current_floor,moving_up,moving_down);
    $dumpfile("elevator_control.vcd");
    $dumpvars(1);
    
    reset=1;
    floor_request=2'b00;
    #10;
    reset=0;
    floor_request=2'b11;
    #100;
    floor_request=2'b10;
    #100;
    floor_request=2'b01;
    #100;
    $finish;
  end
endmodule

    
    