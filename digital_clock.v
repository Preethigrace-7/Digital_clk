`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:38:48 07/16/2023 
// Design Name: 
// Module Name:    digital_clock 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Digital_Clock(
    clk,  //Clock with 1 Hz frequency
    reset,     //active high reset
    seconds,
    minutes,
    hours);

//What are the Inputs?
    input clk;  
    input reset;
//What are the Outputs? 
    output [5:0] seconds;
    output [5:0] minutes;
    output [4:0] hours;
//Internal variables.
    reg [5:0] seconds;
    reg [5:0] minutes;
    reg [4:0] hours;
	 //reg clk_div;
  //Execute the always blocks when the Clock or reset inputs are changing from 0 to 1(positive edge of the signal)
    always @(negedge(clk) or posedge(reset))
    begin
        if(reset == 1'b1) 
				begin  //check for active high reset.
            //reset the time.
            seconds = 0;
            minutes = 0;
            hours = 0;  
				end
        else if(clk == 1'b0) 
				begin  //at the beginning of each second
            seconds = seconds + 6'b1; //increment sec
            if(seconds == 60) 
					 begin //check for max value of sec
                seconds = 0;  //reset seconds
                minutes = minutes + 6'b1; //increment minutes
					 if(minutes == 60) 
						  begin //check for max value of min
                    minutes = 0;  //reset minutes
                    hours = hours + 5'b1;  //increment hours
                   if(hours ==  24) 
								begin  //check for max value of hours
                        hours = 0; //reset hours
                        end 
                    end
                 end     
            end
      end		
	/*	always @(posedge (Clk))
		begin
		if(seconds == 6'b111111)
			clk_div =1;
		else
			clk_div =0;
		end*/
endmodule