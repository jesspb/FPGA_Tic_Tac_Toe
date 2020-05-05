`timescale 1ns / 1ps
module seven_segment_decoder(out, in);
  output reg [6:0] out;
  input [2:0] in;
  always @ (*) begin
    case (in)
      3'b000: out = 7'b0000001;		//Display 0
      3'b001: out = 7'b1001111;		//Display 1
      3'b010: out = 7'b0010010;		//Display 2
      3'b011: out = 7'b0011000;		//Display P
      default: out = 7'b1111111;		//Display nothing
    endcase
  end
endmodule