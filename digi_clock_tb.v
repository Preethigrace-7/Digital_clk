`timescale 1s / 100ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:46:28 07/16/2023
// Design Name:   Digital_Clock
// Module Name:   E:/Digital_clockMP/digi_clock_tb.v
// Project Name:  Digital_clock_MP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Digital_Clock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module tb_clock;

    // Inputs
    reg Clk_1sec;
    reg reset;

    // Outputs
    wire [5:0] seconds;
    wire [5:0] minutes;
    wire [4:0] hours;

    // Instantiate the Unit Under Test (UUT)
    Digital_Clock uut (
        .clk(Clk_1sec), 
        .reset(reset), 
        .seconds(seconds), 
        .minutes(minutes), 
        .hours(hours)
    );
    
    //Generating the Clock with `1 Hz frequency
    initial Clk_1sec = 0;
    always #380 Clk_1sec = ~Clk_1sec;  //Every 0.5 sec toggle the clock.

    initial begin
        reset = 1;// Wait 100 ns for global reset to finish
        #1;
        reset = 0; 
		  #1;
		  Clk_1sec = 0;
		  #1;
    end
      
endmodule

