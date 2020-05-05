`timescale 1ns / 1ps
module switch_bit_reducer (out, player_in);
  output reg [3:0] out;
  input [5:0] player_in;

  //Note: first 3 switches represent rows & last 3 represent columns

  always @ (*) begin
    case (player_in)
      6'b100100: out = 4'b0000;	//Top row left column
      6'b100010: out = 4'b0001; //Top row middle column
      6'b100001: out = 4'b0010;	//Top row right column
      6'b010100: out = 4'b0011; //Middle row left column
      6'b010010: out = 4'b0100;	//Middle row middle column
      6'b010001: out = 4'b0101;	//Middle row right column
      6'b001100: out = 4'b0110;	//Bottom row left column
      6'b001010: out = 4'b0111;	//Bottom row middle column
      6'b001001: out = 4'b1000;	//Bottom row right column
      default: out = 4'b1001;	//Space off the board
    endcase
  end 	//always
endmodule