`timescale 1ns / 1ps
module display_control_led(digit_select, seven_seg, game_status, clk_in, reset);
  output reg [3:0] digit_select;
  output reg [2:0] seven_seg;
  input [11:0] game_status;
  input clk_in, reset;
  reg [1:0] count;
  always @ (posedge clk_in) begin   //Code for 2-bit number
    if (reset) begin
      count <= 0;
    end
    else begin
      count <= count + 1'b1;
    end
  end
  always @ (*) begin    //Code for the digit_select mux
    case (count)
      2'b00: digit_select = 4'b1110;
      2'b01: digit_select = 4'b1101;
      2'b10: digit_select = 4'b1011;
      2'b11: digit_select = 4'b0111;
    endcase
  end
  always @ (*) begin    //Code for the seven_seg mux
    case (count)
     2'b00: seven_seg = game_status[2:0];
     2'b01: seven_seg = game_status[5:3];
     2'b10: seven_seg = game_status[8:6];
     2'b11: seven_seg = game_status[11:9];
    endcase
  end
endmodule