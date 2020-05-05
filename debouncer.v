`timescale 1ns / 1ps
module debouncer (button_out, button_in, clk, reset);
  output reg button_out;
  input button_in, clk, reset;
  reg [40:0] counter;
  always @ (posedge clk) begin
    if (reset) begin
      counter <= 0;
      button_out <= 0;
    end
    else if (counter == 50000000) begin
      counter <= 0;
      button_out <= 1;
    end
    else if (button_in == 1) begin
      counter <= counter + 1;
      button_out <= 0;
    end
    else begin
      counter <= counter;
      button_out <= 0;
    end
  end
endmodule