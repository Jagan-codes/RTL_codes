module car_parking_system_tb;
  reg clk;
  reg reset;
  reg entry;
  reg exit;
  reg [1:0]p1,p2;
  wire green_light,red_light;
  wire[3:0]space_utilized,space_available,cars;
   
  car_parking_system DUT(clk,reset,entry,exit,p1,p2,green_light,red_light,space_utilized,space_available,cars);
    
    initial begin
      clk=1;
      forever #5 clk=~clk;
    end
    
    initial begin
      $monitor("time=%0t clk=%b reset=%b entry=%b exit=%b p1=%b p2=%b green_light=%b red_light=%b space_utilized=%b space_available=%b cars=%b",$time,clk,reset,entry,exit,p1,p2,green_light,red_light,space_utilized,space_available,cars);
      
      $dumpfile("car_parking_system.vcd");
      $dumpvars(1);
      
      reset=1;
      entry=0;
      exit=0;
      p1=0;
      p2=0;
      
      #10;
      
      reset=0;
      entry=1;
      exit=0;
      p1=2'b11;
      p2=2'b11;//default user defined password
      
      #70;
      exit=1;
      entry=0;
      #20;
      $finish;
    end
endmodule
      
      