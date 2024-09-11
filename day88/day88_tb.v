module temperature_controller_tb;
  reg clk;
  reg reset;
  reg [7:0]temperature;
  reg [7:0]set_point;
  reg sensor_valid;
  wire heat;
  wire cold;
  
  temperature_controller DUT(clk,reset,temperature,set_point,sensor_valid,heat,cold);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b temp=%d set_point=%d sensor_valid=%b heat=%b cold=%b",$time,clk,reset,temperature,set_point,sensor_valid,heat,cold);
    $dumpfile("temperature_controller.vcd");
    $dumpvars(1);
    
    reset=1;
    temperature=8'd0;
    set_point=8'd0;
    sensor_valid=0;
    #10;
    reset=0;
    temperature=8'd20;
    set_point=8'd16;
    sensor_valid=1;
    #10;
    temperature=8'd12;
    set_point=8'd18;
    sensor_valid=1;
    #10;
    temperature=8'd12;
    set_point=8'd11;
    sensor_valid=0;
    #10;
    temperature=8'd34;
    set_point=8'd25;
    sensor_valid=1;
    #10;
    temperature=8'd7;
    set_point=8'd46;
    sensor_valid=1;
    #10;
    $finish;
  end
endmodule
  
/* console output 
time=0 clk=0 reset=1 temp=  0 set_point=  0 sensor_valid=0 heat=0 cold=0
time=5 clk=1 reset=1 temp=  0 set_point=  0 sensor_valid=0 heat=0 cold=0
time=10 clk=0 reset=0 temp= 20 set_point= 16 sensor_valid=1 heat=0 cold=0
time=15 clk=1 reset=0 temp= 20 set_point= 16 sensor_valid=1 heat=0 cold=1
time=20 clk=0 reset=0 temp= 12 set_point= 18 sensor_valid=1 heat=0 cold=1
time=25 clk=1 reset=0 temp= 12 set_point= 18 sensor_valid=1 heat=1 cold=0
time=30 clk=0 reset=0 temp= 12 set_point= 11 sensor_valid=0 heat=1 cold=0
time=35 clk=1 reset=0 temp= 12 set_point= 11 sensor_valid=0 heat=0 cold=0
time=40 clk=0 reset=0 temp= 34 set_point= 25 sensor_valid=1 heat=0 cold=0
time=45 clk=1 reset=0 temp= 34 set_point= 25 sensor_valid=1 heat=0 cold=0
time=50 clk=0 reset=0 temp=  7 set_point= 46 sensor_valid=1 heat=0 cold=0
time=55 clk=1 reset=0 temp=  7 set_point= 46 sensor_valid=1 heat=1 cold=0
testbench.sv:48: $finish called at 60 (1s)
time=60 clk=0 reset=0 temp=  7 set_point= 46 sensor_valid=1 heat=1 cold=0*/