`timescale 1ns / 1ps

module checkerboard_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] mem;
	reg confirm;

	// Outputs
	wire [11:0] game_status;

	// Instantiate the Unit Under Test (UUT)
	checker_board uut (
		.clk(clk), 
		.reset(reset), 
		.mem(mem), 
		.game_status(game_status), 
		.confirm(confirm)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		mem = 0;
		confirm = 0;

		// Wait 100 ns for global reset to finish
		#10; reset = 0;
		#10; mem = 32'b00000000000000000000000000000000011;
		#10; confirm = 1;
		#10; confirm = 0;
        
		// Add stimulus here

	end
      
endmodule

