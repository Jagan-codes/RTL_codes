module washing_machine_fsm_tb;
  reg clk;
  reg reset;
  reg start;
  reg [7:0]water_level;
  reg door_closed;
  wire wash;
  wire rinse;
  wire spin;
  wire fault;
  
  washing_machine_fsm DUT(clk,reset,start,water_level,door_closed,wash,rinse,spin,fault);
  initial begin 
    clk=0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b start=%b water_level=%b  door_closed=%b wash=%b rinse=%b spin=%b fault=%b",$time,clk,reset,start,water_level,door_closed,wash,rinse,spin,fault);
    $dumpfile("washing_machine_fsm.vcd");
    $dumpvars(1);
    clk=0;
    start=0;
    door_closed=0;
    water_level=8'd0;
    reset=1;
    #10;
    reset=0;
    start=1;
    door_closed=1;
    water_level=8'd40;
    #10;
    water_level=8'd67;
    #10;
    door_closed=1;
    water_level=8'd45;
    #10;
    door_closed=0;
    #10;
    start=0;
    door_closed=0;
    $finish;
  end
endmodule
    
    /*console output
    time=0 clk=0 reset=1 start=0 water_level=00000000  door_closed=0 wash=0 rinse=0 spin=0 fault=0
time=5 clk=1 reset=1 start=0 water_level=00000000  door_closed=0 wash=0 rinse=0 spin=0 fault=0
time=10 clk=0 reset=0 start=1 water_level=00101000  door_closed=1 wash=0 rinse=0 spin=0 fault=0
time=15 clk=1 reset=0 start=1 water_level=00101000  door_closed=1 wash=0 rinse=0 spin=0 fault=0
time=20 clk=0 reset=0 start=1 water_level=01000011  door_closed=1 wash=0 rinse=0 spin=0 fault=0
time=25 clk=1 reset=0 start=1 water_level=01000011  door_closed=1 wash=1 rinse=0 spin=0 fault=0
time=30 clk=0 reset=0 start=1 water_level=00101101  door_closed=1 wash=1 rinse=0 spin=0 fault=0
time=35 clk=1 reset=0 start=1 water_level=00101101  door_closed=1 wash=0 rinse=1 spin=0 fault=0
time=40 clk=0 reset=0 start=1 water_level=00101101  door_closed=0 wash=0 rinse=1 spin=0 fault=0
time=45 clk=1 reset=0 start=1 water_level=00101101  door_closed=0 wash=0 rinse=0 spin=1 fault=0
testbench.sv:42: $finish called at 50 (1s)
time=50 clk=0 reset=0 start=0 water_level=00101101  door_closed=0 wash=0 rinse=0 spin=1 fault=0*/
    