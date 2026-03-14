`timescale 1ns / 1ps
/**
MUST CHANGE "simpleDivider.v" top parameter
if you want to simulate

0 = Simulation

23 = Implementation



*/
module top_tb;
    reg clk100MHz;
    reg reset;
    reg halt;

    wire [7:0] regOut;

    top inst(.clk100Mhz(clk100MHz),.reset(reset),.halt(halt),.regOut(regOut));

    initial
    begin
        clk100MHz = 0;
        forever
        begin
            #5 clk100MHz = ~clk100MHz;
        end
    end

    //"Just looking at values of $1 in the waveforms is sufficient."
    //did not create a complex testbench for part 2 as not necessary
    //only need to observe correct behavior
    //will test normal looping, resetting, and halting
    initial begin
        reset = 1;
        halt = 0;
        #50;
        //start with reset high
        
        reset = 0;
        #300
        //normal looping for 300 ns
        
        halt = 1;
        #100
        //halt for 100 ns
        
        
        halt = 0;
        #400
        //normal looping for 400 ns
        
        reset = 1;
        #50; // reset for 50 ns
        
        reset = 0;
        #100
        //normal looping for 100ns
        
        
        $stop;        
    end

endmodule
