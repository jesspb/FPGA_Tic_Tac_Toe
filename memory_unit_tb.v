`timescale 1ns / 1ps
module memory_unit_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] pl_inp;
	reg [3:0] comp_inp;
	reg gamemode_switch;

	// Outputs
	wire [31:0] num;

	// Instantiate the Unit Under Test (UUT)
	memory_unit uut (
		.clk(clk), 
		.reset(reset), 
		.pl_inp(pl_inp), 
		.comp_inp(comp_inp), 
		.gamemode_switch(gamemode_switch), 
		.num(num)
	);

	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		pl_inp = 0;
		comp_inp = 0;
		gamemode_switch = 0;
		#1000; reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
			#10; pl_inp = 4'b0000;
        #10; comp_inp = 4'b0100;
        #10; pl_inp = 4'b0001;
        #10; comp_inp = 4'b0110;

	end
      
endmodule

