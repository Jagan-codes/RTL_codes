module digital_watch_fsm_tb;
  reg clk;
  reg reset;
  reg mode_button;
  reg up;
  reg down;
  wire [5:0]hour;
  wire [5:0]minute;
  wire alarm_trigger;
  
  digital_watch_fsm DUT(clk,reset,mode_button,up,down,hour,minute,alarm_trigger);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor("time=%0t clk=%b reset=%b mode_button=%b up=%b down=%b hour=%b minute=%b alarm_trigger=%b",$time,clk,reset,mode_button,up,down,hour,minute,alarm_trigger);
    $dumpfile("digital_watch_fsm.vcd");
    $dumpvars(1);
    
    reset=1;
    mode_button=0;
    up=0;
    down=0;
    
    #10;
    reset=0;
    #10;
    mode_button=1;
    #10;
    mode_button=0;
    up=1;
    #10;
    up=0;
    mode_button=1;
    #10;
    mode_button=0;
    up=1;
    #10;
    up=0;
    mode_button=1;
    #10;
    mode_button=0;
    
    
    up=1;
    #20;
    up=0;
    mode_button=0;
    #10;
    mode_button=0;
    
    $finish;
  end
endmodule
/* console output
time=0 clk=0 reset=1 mode_button=0 up=0 down=0 hour=000000 minute=000000 alarm_trigger=0
time=5 clk=1 reset=1 mode_button=0 up=0 down=0 hour=000000 minute=000000 alarm_trigger=0
time=10 clk=0 reset=0 mode_button=0 up=0 down=0 hour=000000 minute=000000 alarm_trigger=0
time=15 clk=1 reset=0 mode_button=0 up=0 down=0 hour=000000 minute=000000 alarm_trigger=0
time=20 clk=0 reset=0 mode_button=1 up=0 down=0 hour=000000 minute=000000 alarm_trigger=0
time=25 clk=1 reset=0 mode_button=1 up=0 down=0 hour=000000 minute=000000 alarm_trigger=0
time=30 clk=0 reset=0 mode_button=0 up=1 down=0 hour=000001 minute=000000 alarm_trigger=0
time=35 clk=1 reset=0 mode_button=0 up=1 down=0 hour=000001 minute=000000 alarm_trigger=0
time=40 clk=0 reset=0 mode_button=1 up=0 down=0 hour=000001 minute=000000 alarm_trigger=0
time=45 clk=1 reset=0 mode_button=1 up=0 down=0 hour=000001 minute=000000 alarm_trigger=0
time=50 clk=0 reset=0 mode_button=0 up=1 down=0 hour=000001 minute=000001 alarm_trigger=0
time=55 clk=1 reset=0 mode_button=0 up=1 down=0 hour=000001 minute=000001 alarm_trigger=0
time=60 clk=0 reset=0 mode_button=1 up=0 down=0 hour=000001 minute=000001 alarm_trigger=0
time=65 clk=1 reset=0 mode_button=1 up=0 down=0 hour=000001 minute=000001 alarm_trigger=0
time=70 clk=0 reset=0 mode_button=0 up=1 down=0 hour=000001 minute=000001 alarm_trigger=1
time=75 clk=1 reset=0 mode_button=0 up=1 down=0 hour=000001 minute=000001 alarm_trigger=1
time=80 clk=0 reset=0 mode_button=0 up=1 down=0 hour=000001 minute=000001 alarm_trigger=1
time=85 clk=1 reset=0 mode_button=0 up=1 down=0 hour=000001 minute=000001 alarm_trigger=1
time=90 clk=0 reset=0 mode_button=0 up=0 down=0 hour=000001 minute=000001 alarm_trigger=1
time=95 clk=1 reset=0 mode_button=0 up=0 down=0 hour=000001 minute=000001 alarm_trigger=1*/