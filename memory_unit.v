`timescale 1ns / 1ps
module memory_unit(clk, reset, pl_inp, comp_inp, gamemode_switch, num);
  input clk, reset, gamemode_switch;
  input [3:0]pl_inp;
  input [3:0]comp_inp;
  output wire [31:0]num;
  reg [3:0]counter;
  reg [1:0]mem[0:15];
  reg turn_count;
  reg gamemode;
	
  // reset

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      mem[counter] <= 2'd0;
      // 1 player vs computer game
      counter <= counter + 1'd1;
      turn_count <= 0;
      if (~gamemode_switch) begin
        gamemode <= 0;
      end 
      else begin
        gamemode <= 1;
      end
    end 
    else if (~gamemode) begin
      if (mem[pl_inp] < 2) begin
        mem[pl_inp] <= 2'b11;
      end 
      if (mem[comp_inp] < 2) begin
        mem[comp_inp] <= 2'b10;
      end
      // 2 player game
    end
    else begin
      if (mem[pl_inp] < 2) begin
        if (~turn_count) begin
          mem[pl_inp] <= 2'b11;
          turn_count <= ~turn_count;
        end 
        else begin
          mem[pl_inp] <= 2'b10;
          turn_count <= ~turn_count;
        end
        counter <= 4'd0;
      end
    end
  end
  assign num = {mem[15], mem[14], mem[13], mem[12], mem[11], mem[10], mem[9], mem[8], mem[7], mem[6], mem[5], mem[4], mem[3], mem[2], mem[1], mem[0]}; 
endmodule
