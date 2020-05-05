`timescale 1ns / 1ps
module checker_board(clk, reset, mem, game_status, confirm);
  input clk;
  input confirm;
  input reset;
  input [31:0]mem;
  wire [1:0]mem_array[0:15];
  output reg [11:0]game_status;
  reg [3:0]counter;
  reg [2:0]counter_p1;
  reg [2:0]counter_p2;
  reg [3:0] turncounter;

  assign {mem_array[15],mem_array[14],mem_array[13],mem_array[12],mem_array[11],mem_array[10],mem_array[9],mem_array[8],mem_array[7],mem_array[6],mem_array[5],mem_array[4],mem_array[3],mem_array[2],mem_array[1],mem_array[0]}=mem;

	
  always @ (posedge clk) begin
    for(counter = 0; counter < 4'b1001; counter = counter+1) begin
      if(mem_array[counter]==2'b11)begin
        counter_p1<=counter_p1+1;
      end 
      else if(mem_array[counter]==2'b10)begin
        counter_p2<=counter_p2+1;
      end
    end
    if (reset) begin
      counter_p1 <= 0;
      counter_p2 <=0;
    end
  end
	 
  always @(posedge confirm or posedge reset) begin
    if (reset) begin
      turncounter = 0;
    end
    else if (turncounter == 10) begin
      turncounter = 0;
    end
    else begin
      turncounter = turncounter + 1;
    end
  end
	 
  always @(*) begin 
    if (reset) begin
      game_status<=12'b111111011001;
    end 
    else if (mem_array[0]==2'b10 && mem_array[3]==2'b10 && mem_array[6]==2'b10 || mem_array[1]==2'b10 && mem_array[4]==2'b10 && mem_array[7]==2'b10 || mem_array[2]==2'b10 && mem_array[5]==2'b10 && mem_array[8]==2'b10 || mem_array[0]==2'b10 && mem_array[1]==2'b10 && mem_array[2]==2'b10 || mem_array[3]==2'b10 && mem_array[4]==2'b10 && mem_array[5]==2'b10 || mem_array[6]==2'b10 && mem_array[7]==2'b10 && mem_array[8]==2'b10 || mem_array[0]==2'b10 && mem_array[4]==2'b10 && mem_array[8]==2'b10 || mem_array[2]==2'b10 && mem_array[4]==2'b10 && mem_array[6]==2'b10)begin
      game_status<=12'b010010010010;
      //Player 1 wins
    end 
    else if(mem_array[0]==2'b11 && mem_array[3]==2'b11 && mem_array[6]==2'b11 || mem_array[1]==2'b11 && mem_array[4]==2'b11 && mem_array[7]==2'b11 || mem_array[2]==2'b11 && mem_array[5]==2'b11 && mem_array[8]==2'b11 || mem_array[0]==2'b11 && mem_array[1]==2'b11 && mem_array[2]==2'b11 || mem_array[3]==2'b11 && mem_array[4]==2'b11 && mem_array[5]==2'b11 || mem_array[6]==2'b11 && mem_array[7]==2'b11 && mem_array[8]==2'b11 || mem_array[0]==2'b11 && mem_array[4]==2'b11 && mem_array[8]==2'b11 || mem_array[2]==2'b11 && mem_array[4]==2'b11 && mem_array[6]==2'b11) begin
      game_status<=12'b001001001001;
      //Player 2 wins
    end 
    else if (turncounter == 9) begin
      game_status<=12'b000000000000;		
      //Draw
    end
    else if (turncounter %2 == 0)begin
      game_status<=12'b111111011001;
      //Player 1 turn
    end 
    else if (turncounter%2 == 1) begin
      game_status<=12'b111111011010;
      //Player 2 turn
    end
  end
endmodule
