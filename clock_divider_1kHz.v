`timescale 1ns / 1ps
module clock_divider_1kHz(clk_out, clk, reset);
  output reg clk_out;
  input clk, reset;
  reg [16:0] counter;
  always @ (posedge clk) begin
    if (reset) begin
      counter <= 17'b0;
      clk_out <= 1'b0;
    end
    else if (counter == 17'd100000) begin
      counter <= 17'b0;
      clk_out <= ~clk_out;
    end
    else begin
      counter <= counter + 1'b1;
    end
  end
endmodule
