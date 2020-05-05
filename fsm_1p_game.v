`timescale 1ns / 1ps
module fsm_1p_game (out, in, clean_confirm_button, reset);
  output reg [3:0] out;		//Output is: computer_input
  input [3:0] in;		//Input is: player_input
  input clean_confirm_button, reset;
  reg [3:0] out_next;
  reg [6:0] curr_state, next_state;
  parameter s0 = 7'b0000000,
            s1 = 7'b0000001,
            s2 = 7'b0000010,
            s3 = 7'b0000011,
            s4 = 7'b0000100,
            s5 = 7'b0000101,
            s6 = 7'b0000110,
            s7 = 7'b0000111,
            s8 = 7'b0001000,
            s9 = 7'b0001001,
            s10 = 7'b0001010,
            s11 = 7'b0001011,
            s12 = 7'b0001100,
            s13 = 7'b0001101,
            s14 = 7'b0001110,
            s15 = 7'b0001111,
            s16 = 7'b0010000,
            s17 = 7'b0010001,
            s18 = 7'b0010010,
            s19 = 7'b0010011,
            s20 = 7'b0010100,
            s21 = 7'b0010101,
            s22 = 7'b0010110,
            s23 = 7'b0010111,
            s24 = 7'b0011000,
            s25 = 7'b0011001,
            s26 = 7'b0011010,
            s27 = 7'b0011011,
            s28 = 7'b0011100,
            s29 = 7'b0011101,
            s30 = 7'b0011110,
            s31 = 7'b0011111,
            s32 = 7'b0100000,
            s33 = 7'b0100001,
            s34 = 7'b0100010,
            s35 = 7'b0100011,
            s36 = 7'b0100100,
            s37 = 7'b0100101,
            s38 = 7'b0100110,
            s39 = 7'b0100111,
            s40 = 7'b0101000,
            s41 = 7'b0101001,
            s42 = 7'b0101010,
            s43 = 7'b0101011,
            s44 = 7'b0101100,
            s45 = 7'b0101101,
            s46 = 7'b0101110,
            s47 = 7'b0101111,
            s48 = 7'b0110000,
            s49 = 7'b0110001,
            s50 = 7'b0110010,
            s51 = 7'b0110011,
            s52 = 7'b0110100,
            s53 = 7'b0110101,
            s54 = 7'b0110110,
            s55 = 7'b0110111,
            s56 = 7'b0111000,
            s57 = 7'b0111001,
            s58 = 7'b0111010,
            s59 = 7'b0111011,
            s60 = 7'b0111100,
            s61 = 7'b0111101,
            s62 = 7'b0111110,
            s63 = 7'b0111111,
            s64 = 7'b1000000,
            s65 = 7'b1000001,
            s66 = 7'b1000010,
            s67 = 7'b1000011,
            s68 = 7'b1000100,
            s69 = 7'b1000101,
            s70 = 7'b1000110,
            s71 = 7'b1000111,
            s72 = 7'b1001000,
            s73 = 7'b1001001,
            s74 = 7'b1001010,
            s75 = 7'b1001011,
            s76 = 7'b1001100,
            s77 = 7'b1001101,
            s78 = 7'b1001110,
            s79 = 7'b1001111,
            s80 = 7'b1010000,
            s81 = 7'b1010001,
            s82 = 7'b1010010,
            s83 = 7'b1010011,
            s84 = 7'b1010100,
            s85 = 7'b1010101,
            s86 = 7'b1010110,
            s87 = 7'b1010111,
            s88 = 7'b1011000,
            s89 = 7'b1011001,
            s90 = 7'b1011010,
            s91 = 7'b1011011,
            s92 = 7'b1011100,	//Note: unused as game never ends on center cell
            s93 = 7'b1011101,
            s94 = 7'b1011110,
            s95 = 7'b1011111,
            s96 = 7'b1100000;
  
  //Sequential logic
  always @ (posedge clean_confirm_button or posedge reset) begin
    if (reset) begin
      curr_state <= s0;
      out <= 4'b1010;
    end
    else begin
      curr_state <= next_state;
      out <= out_next;
    end
  end

  //Combinational logic
  always @ (*) begin
    case (curr_state)
      s0: if (in == 4'b0000) begin
            next_state = s1;
            out_next = 4'b0100;
          end
          else if (in == 4'b0001) begin
            next_state = s2;
            out_next = 4'b0100;
          end
          else if (in == 4'b0010) begin
            next_state = s3;
            out_next = 4'b0100;
          end
          else if (in == 4'b0011) begin
            next_state = s4;
            out_next = 4'b0100;
          end
          else if (in == 4'b0100) begin
            next_state = s5;
            out_next = 4'b0110;
          end
          else if (in == 4'b0101) begin
            next_state = s6;
            out_next = 4'b0100;
          end
          else if (in == 4'b0110) begin
            next_state = s7;
            out_next = 4'b0100;
          end
          else if (in == 4'b0111) begin
            next_state = s8;
            out_next = 4'b0100;
          end
          else if (in == 4'b1000) begin
            next_state = s9;
            out_next = 4'b0100;
          end
          else begin
            next_state = s0;
            out_next = 4'b1010;
          end
      s1: if (in == 4'b0001) begin
            next_state = s10;
            out_next = 4'b0010;
          end
          else if (in == 4'b0010) begin
            next_state = s12;
            out_next = 4'b0001;
          end
          else if (in == 4'b0011) begin
            next_state = s14;
            out_next = 4'b0110;
          end
          else if (in == 4'b0101) begin
            next_state = s16;
            out_next = 4'b0001;
          end
          else if (in == 4'b0110) begin
            next_state = s18;
            out_next = 4'b0011;
          end
          else if (in == 4'b0111) begin
            next_state = s20;
            out_next = 4'b0011;
          end
          else if (in == 4'b1000) begin
            next_state = s22;
            out_next = 4'b0111;
          end
          else begin
            next_state = s1;
            out_next = 4'b0100;
          end
      s2: if (in == 4'b0000) begin
            next_state = s10;
            out_next = 4'b0010;
          end
          else if (in == 4'b0010) begin
            next_state = s24;
            out_next = 4'b0000;
          end
          else if (in == 4'b0011) begin
            next_state = s26;
            out_next = 4'b0000;
          end
          else if (in == 4'b0101) begin
            next_state = s28;
            out_next = 4'b0010;
          end
          else if (in == 4'b0110) begin
            next_state = s30;
            out_next = 4'b0011;
          end
          else if (in == 4'b0111) begin
            next_state = s32;
            out_next = 4'b0110;
          end
          else if (in == 4'b1000) begin
            next_state = s34;
            out_next = 4'b0101;
          end
          else begin
            next_state = s2;
            out_next = 4'b0100;
          end
      s3: if (in == 4'b0000) begin
            next_state = s12;
            out_next = 4'b0001;
          end
          else if (in == 4'b0001) begin
            next_state = s24;
            out_next = 4'b0000;
          end
          else if (in == 4'b0011) begin
            next_state = s36;
            out_next = 4'b0001;
          end
          else if (in == 4'b0101) begin
            next_state = s38;
            out_next = 4'b1000;
          end
          else if (in == 4'b0110) begin
            next_state = s40;
            out_next = 4'b0011;
          end
          else if (in == 4'b0111) begin
            next_state = s42;
            out_next = 4'b0101;
          end
          else if (in == 4'b1000) begin
            next_state = s44;
            out_next = 4'b0101;
          end
          else begin
            next_state = s3;
            out_next = 4'b0100;
          end
      s4: if (in == 4'b0000) begin
            next_state = s14;
            out_next = 4'b0001;
          end
          else if (in == 4'b0001) begin
            next_state = s26;
            out_next = 4'b0000;
          end
          else if (in == 4'b0010) begin
            next_state = s36;
            out_next = 4'b0001;
          end
          else if (in == 4'b0101) begin
            next_state = s46;
            out_next = 4'b0110;
          end
          else if (in == 4'b0110) begin
            next_state = s48;
            out_next = 4'b0000;
          end
          else if (in == 4'b0111) begin
            next_state = s50;
            out_next = 4'b0110;
          end
          else if (in == 4'b1000) begin
            next_state = s52;
            out_next = 4'b0111;
          end
          else begin
            next_state = s4;
            out_next = 4'b0100;
          end
      s5: if (in == 4'b0000) begin
            next_state = s54;
            out_next = 4'b1000;
          end
          else if (in == 4'b0001) begin
            next_state = s56;
            out_next = 4'b0111;
          end
          else if (in == 4'b0010) begin
            next_state = s58;
            out_next = 4'b0000;
          end
          else if (in == 4'b0011) begin
            next_state = s60;
            out_next = 4'b0101;
          end
          else if (in == 4'b0101) begin
            next_state = s66;
            out_next = 4'b0011;
          end
          else if (in == 4'b0111) begin
            next_state = s68;
            out_next = 4'b0001;
          end
          else if (in == 4'b1000) begin
            next_state = s74;
            out_next = 4'b0000;
          end
          else begin
            next_state = s5;
            out_next = 4'b0110;
          end
      s6: if (in == 4'b0000) begin
            next_state = s16;
            out_next = 4'b0001;
          end
          else if (in == 4'b0001) begin
            next_state = s28;
            out_next = 4'b0010;
          end
          else if (in == 4'b0010) begin
            next_state = s38;
            out_next = 4'b1000;
          end
          else if (in == 4'b0011) begin
            next_state = s46;
            out_next = 4'b0110;
          end
          else if (in == 4'b0110) begin
            next_state = s76;
            out_next = 4'b0111;
          end
          else if (in == 4'b0111) begin
            next_state = s78;
            out_next = 4'b1000;
          end
          else if (in == 4'b1000) begin
            next_state = s80;
            out_next = 4'b0010;
          end
          else begin
            next_state = s6;
            out_next = 4'b0100;
          end
      s7: if (in == 4'b0000) begin
            next_state = s18;
            out_next = 4'b0011;
          end
          else if (in == 4'b0001) begin
            next_state = s30;
            out_next = 4'b0011;
          end
          else if (in == 4'b0010) begin
            next_state = s40;
            out_next = 4'b0011;
          end
          else if (in == 4'b0011) begin
            next_state = s48;
            out_next = 4'b0000;
          end
          else if (in == 4'b0101) begin
            next_state = s76;
            out_next = 4'b0111;
          end
          else if (in == 4'b0111) begin
            next_state = s82;
            out_next = 4'b1000;
          end
          else if (in == 4'b1000) begin
            next_state = s84;
            out_next = 4'b0111;
          end
          else begin
            next_state = s7;
            out_next = 4'b0100;
          end
      s8: if (in == 4'b0000) begin
            next_state = s20;
            out_next = 4'b0011;
          end
          else if (in == 4'b0001) begin
            next_state = s32;
            out_next = 4'b0110;
          end
          else if (in == 4'b0010) begin
            next_state = s42;
            out_next = 4'b0101;
          end
          else if (in == 4'b0011) begin
            next_state = s50;
            out_next = 4'b0110;
          end
          else if (in == 4'b0101) begin
            next_state = s78;
            out_next = 4'b1000;
          end
          else if (in == 4'b0110) begin
            next_state = s82;
            out_next = 4'b1000;
          end
          else if (in == 4'b1000) begin
            next_state = s86;
            out_next = 4'b0110;
          end
          else begin
            next_state = s8;
            out_next = 4'b0100;
          end
      s9: if (in == 4'b0000) begin
            next_state = s22;
            out_next = 4'b0111;
          end
          else if (in == 4'b0001) begin
            next_state = s34;
            out_next = 4'b0101;
          end
          else if (in == 4'b0010) begin
            next_state = s44;
            out_next = 4'b0101;
          end
          else if (in == 4'b0011) begin
            next_state = s52;
            out_next = 4'b0111;
          end
          else if (in == 4'b0101) begin
            next_state = s80;
            out_next = 4'b0010;
          end
          else if (in == 4'b0110) begin
            next_state = s84;
            out_next = 4'b0111;
          end
          else if (in == 4'b0111) begin
            next_state = s86;
            out_next = 4'b0110;
          end
          else begin
            next_state = s9;
            out_next = 4'b0100;
          end
      s10: if (in == 4'b0110) begin
             next_state = s11;
             out_next = 4'b0011;
           end
           else if (in == 4'b0011 || in == 4'b0101 || in == 4'b0111 || in == 4'b1000) begin
             next_state = s94;
             out_next = 4'b0110;
           end
           else begin
             next_state = s10;
             out_next = 4'b0010;
           end
      s11: if (in == 4'b0101) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else if (in == 4'b0111 || in == 4'b1000) begin
             next_state = s93;
             out_next = 4'b0101;
           end
           else begin
             next_state = s11;
             out_next = 4'b0011;
           end
      s12: if (in == 4'b0111) begin
             next_state = s13;
             out_next = 4'b0011;
           end
           else if (in == 4'b0011 || in == 4'b0101 || in == 4'b0110 || in == 4'b1000) begin
             next_state = s95;
             out_next = 4'b0111;
           end
           else begin
             next_state = s12;
             out_next = 4'b0001;
           end
      s13: if (in == 4'b0101) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else if (in == 4'b0110 || in == 4'b1000) begin
             next_state = s93;
             out_next = 4'b0101;
           end
           else begin
             next_state = s13;
             out_next = 4'b0011;
           end
      s14: if (in == 4'b0010) begin
             next_state = s15;
             out_next = 4'b0001;
           end
           else if (in == 4'b0001 || in == 4'b0101 || in == 4'b0111 || in == 4'b1000) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else begin
             next_state = s14;
             out_next = 4'b0110;
           end
      s15: if (in == 4'b0111) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else if (in == 4'b0101 || in == 4'b1000) begin
             next_state = s95;
             out_next = 4'b0111;
           end
           else begin
             next_state = s15;
             out_next = 4'b0001;
           end
      s16: if (in == 4'b0111) begin
             next_state = s17;
             out_next = 4'b0110;
           end
           else if (in == 4'b0010 || in == 4'b0011 || in == 4'b0110 || in == 4'b1000) begin
             next_state = s95;
             out_next = 4'b0111;
           end
           else begin
             next_state = s16;
             out_next = 4'b0001;
           end
      s17: if (in == 4'b0010) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else if (in == 4'b0011 || in == 4'b1000) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else begin
             next_state = s17;
             out_next = 4'b0110;
           end
      s18: if (in == 4'b0101) begin
             next_state = s19;
             out_next = 4'b0111;
           end
           else if (in == 4'b0001 || in == 4'b0010 || in == 4'b0111 || in == 4'b1000) begin
             next_state = s93;
             out_next = 4'b0101;
           end
           else begin
             next_state = s18;
             out_next = 4'b0011;
           end
      s19: if (in == 4'b0001) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else if (in == 4'b0010 || in == 4'b1000) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else begin
             next_state = s19;
             out_next = 4'b0111;
           end
      s20: if (in == 4'b0101) begin
             next_state = s21;
             out_next = 4'b0010;
           end
           else if (in == 4'b0001 || in == 4'b0010 || in == 4'b0110 || in == 4'b1000) begin
             next_state = s93;
             out_next = 4'b0101;
           end
           else begin
             next_state = s20;
             out_next = 4'b0011;
           end
      s21: if (in == 4'b0110) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else if (in == 4'b0001 || in == 4'b1000) begin
             next_state = s94;
             out_next = 4'b0110;
           end
           else begin
             next_state = s21;
             out_next = 4'b0010;
           end
      s22: if (in == 4'b0001) begin
             next_state = s23;
             out_next = 4'b0010;
           end
           else if (in == 4'b0010 || in == 4'b0011 || in == 4'b0101 || in == 4'b0110) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else begin
             next_state = s22;
             out_next = 4'b0111;
           end
      s23: if (in == 4'b0110) begin
             next_state = s91;
             out_next = 4'b0011;
           end
           else if (in == 4'b0011 || in == 4'b0101) begin
             next_state = s94;
             out_next = 4'b0110;
           end
           else begin
             next_state = s23;
             out_next = 4'b0010;
           end
      s24: if (in == 4'b1000) begin
             next_state = s25;
             out_next = 4'b0101;
           end
           else if (in == 4'b0011 || in == 4'b0101 || in == 4'b0110 || in == 4'b0111) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else begin
             next_state = s24;
             out_next = 4'b0000;
           end
      s25: if (in == 4'b0011) begin
             next_state = s94;
             out_next = 4'b0110;
           end
           else if (in == 4'b0110 || in == 4'b0111) begin
             next_state = s91;
             out_next = 4'b0011;
           end
           else begin
             next_state = s25;
             out_next = 4'b0101;
           end
      s26: if (in == 4'b1000) begin
             next_state = s27;
             out_next = 4'b0110;
           end
           else if (in == 4'b0010 || in == 4'b0101 || in == 4'b0110 || in == 4'b0111) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else begin
             next_state = s26;
             out_next = 4'b0000;
           end
      s27: if (in == 4'b0010) begin
             next_state = s93;
             out_next = 4'b0101;
           end
           else if (in == 4'b0101 || in == 4'b0111) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else begin
             next_state = s27;
             out_next = 4'b0110;
           end
      s28: if (in == 4'b0110) begin
             next_state = s29;
             out_next = 4'b0000;
           end
           else if (in == 4'b0000 || in == 4'b0011 || in == 4'b0111 || in == 4'b1000) begin
             next_state = s94;
             out_next = 4'b0110;
           end
           else begin
             next_state = s28;
             out_next = 4'b0010;
           end
      s29: if (in == 4'b1000) begin
             next_state = s95;
             out_next = 4'b0111;
           end
           else if (in == 4'b0011 || in == 4'b0111) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else begin
             next_state = s29;
             out_next = 4'b0000;
           end
      s30: if (in == 4'b0101) begin
             next_state = s31;
             out_next = 4'b1000;
           end
           else if (in == 4'b0000 || in == 4'b0010 || in == 4'b0111 || in == 4'b1000) begin
             next_state = s93;
             out_next = 4'b0101;
           end
           else begin
             next_state = s30;
             out_next = 4'b0011;
           end
      s31: if (in == 4'b0000) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else if (in == 4'b0010 || in == 4'b0111) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else begin
             next_state = s31;
             out_next = 4'b1000;
           end
      s32: if (in == 4'b0010) begin
             next_state = s33;
             out_next = 4'b0000;
           end
           else if (in == 4'b0000 || in == 4'b0011 || in == 4'b0101 || in == 4'b1000) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else begin
             next_state = s32;
             out_next = 4'b0110;
           end
      s33: if (in == 4'b1000) begin
             next_state = s91;
             out_next = 4'b0011;
           end
           else if (in == 4'b0011 || in == 4'b0101) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else begin
             next_state = s33;
             out_next = 4'b0000;
           end
      s34: if (in == 4'b0011) begin
             next_state = s35;
             out_next = 4'b0110;
           end
           else if (in == 4'b0000 || in == 4'b0010 || in == 4'b0110 || in == 4'b0111) begin
             next_state = s91;
             out_next = 4'b0011;
           end
           else begin
             next_state = s34;
             out_next = 4'b0101;
           end
      s35: if (in == 4'b0010) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else if (in == 4'b0000 || in == 4'b0111) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else begin
             next_state = s35;
             out_next = 4'b0110;
           end
      s36: if (in == 4'b0111) begin
             next_state = s37;
             out_next = 4'b1000;
           end
           else if (in == 4'b0000 || in == 4'b0101 || in == 4'b0110 || in == 4'b1000) begin
             next_state = s95;
             out_next = 4'b0111;
           end
           else begin
             next_state = s36;
             out_next = 4'b0001;
           end
      s37: if (in == 4'b0000) begin
             next_state = s94;
             out_next = 4'b0110;
           end
           else if (in == 4'b0110 || in == 4'b0101) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else begin
             next_state = s37;
             out_next = 4'b1000;
           end
      s38: if (in == 4'b0000) begin
             next_state = s39;
             out_next = 4'b0001;
           end
           else if (in == 4'b0001 || in == 4'b0011 || in == 4'b0110 || in == 4'b0111) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else begin
             next_state = s38;
             out_next = 4'b1000;
           end
      s39: if (in == 4'b0111) begin
             next_state = s94;
             out_next = 4'b0110;
           end
           else if (in == 4'b0011 || in == 4'b0110) begin
             next_state = s95;
             out_next = 4'b0111;
           end
           else begin
             next_state = s39;
             out_next = 4'b0001;
           end
      s40: if (in == 4'b0101) begin
             next_state = s41;
             out_next = 4'b1000;
           end
           else if (in == 4'b0000 || in == 4'b0001 || in == 4'b0111 || in == 4'b1000) begin
             next_state = s93;
             out_next = 4'b0101;
           end
           else begin
             next_state = s40;
             out_next = 4'b0011;
           end
      s41: if (in == 4'b0000) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else if (in == 4'b0001 || in == 4'b0111) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else begin
             next_state = s41;
             out_next = 4'b1000;
           end
      s42: if (in == 4'b0011) begin
             next_state = s43;
             out_next = 4'b0000;
           end
           else if (in == 4'b0000 || in == 4'b0001 || in == 4'b0110 || in == 4'b1000) begin
             next_state = s91;
             out_next = 4'b0011;
           end
           else begin
             next_state = s42;
             out_next = 4'b0101;
           end
      s43: if (in == 4'b1000) begin
             next_state = s94;
             out_next = 4'b0110;
           end
           else if (in == 4'b0001 || in == 4'b0110) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else begin
             next_state = s43;
             out_next = 4'b0000;
           end
      s44: if (in == 4'b0011) begin
             next_state = s45;
             out_next = 4'b0001;
           end
           else if (in == 4'b0000 || in == 4'b0001 || in == 4'b0110 || in == 4'b0111) begin
             next_state = s91;
             out_next = 4'b0011;
           end
           else begin
             next_state = s44;
             out_next = 4'b0101;
           end
      s45: if (in == 4'b0111) begin
             next_state = s94;
             out_next = 4'b0110;
           end
           else if (in == 4'b0000 || in == 4'b0110) begin
             next_state = s95;
             out_next = 4'b0111;
           end
           else begin
             next_state = s45;
             out_next = 4'b0001;
           end
      s46: if (in == 4'b0010) begin
             next_state = s47;
             out_next = 4'b1000;
           end
           else if (in == 4'b0000 || in == 4'b0001 || in == 4'b0111 || in == 4'b1000) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else begin
             next_state = s46;
             out_next = 4'b0110;
           end
      s47: if (in == 4'b0000) begin
             next_state = s95;
             out_next = 4'b0111;
           end
           else if (in == 4'b0001 || in == 4'b0111) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else begin
             next_state = s47;
             out_next = 4'b1000;
           end
      s48: if (in == 4'b1000) begin
             next_state = s49;
             out_next = 4'b0111;
           end
           else if (in == 4'b0001 || in == 4'b0010 || in == 4'b0101 || in == 4'b0111) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else begin
             next_state = s48;
             out_next = 4'b0000;
           end
      s49: if (in == 4'b0001) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else if (in == 4'b0010 || in == 4'b0101) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else begin
             next_state = s49;
             out_next = 4'b0111;
           end
      s50: if (in == 4'b0010) begin
             next_state = s51;
             out_next = 4'b1000;
           end
           else if (in == 4'b0000 || in == 4'b0001 || in == 4'b0101 || in == 4'b1000) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else begin
             next_state = s50;
             out_next = 4'b0110;
           end
      s51: if (in == 4'b0000) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else if (in == 4'b0001 || in == 4'b0101) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else begin
             next_state = s51;
             out_next = 4'b1000;
           end
      s52: if (in == 4'b0001) begin
             next_state = s53;
             out_next = 4'b0010;
           end
           else if (in == 4'b0000 || in == 4'b0010 || in == 4'b0101 || in == 4'b0110) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else begin
             next_state = s52;
             out_next = 4'b0111;
           end
      s53: if (in == 4'b0110) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else if (in == 4'b0000 || in == 4'b0101) begin
             next_state = s94;
             out_next = 4'b0110;
           end
           else begin
             next_state = s53;
             out_next = 4'b0010;
           end
      s54: if (in == 4'b0111) begin
             next_state = s55;
             out_next = 4'b0001;
           end
           else if (in == 4'b0001 || in == 4'b0010 || in == 4'b0011 || in == 4'b0101) begin
             next_state = s95;
             out_next = 4'b0111;
           end
           else begin
             next_state = s54;
             out_next = 4'b1000;
           end
      s55: if (in == 4'b0101) begin
             next_state = s91;
             out_next = 4'b0011;
           end
           else if (in == 4'b0010 || in == 4'b0011) begin
             next_state = s93;
             out_next = 4'b0101;
           end
           else begin
             next_state = s55;
             out_next = 4'b0001;
           end
      s56: if (in == 4'b1000) begin
             next_state = s57;
             out_next = 4'b0000;
           end
           else if (in == 4'b0000 || in == 4'b0010 || in == 4'b0011 || in == 4'b0101) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else begin
             next_state = s56;
             out_next = 4'b0111;
           end
      s57: if (in == 4'b0011) begin
             next_state = s93;
             out_next = 4'b0101;
           end
           else if (in == 4'b0010 || in == 4'b0101) begin
             next_state = s91;
             out_next = 4'b0011;
           end
           else begin
             next_state = s57;
             out_next = 4'b0000;
           end
      s58: if (in == 4'b0011) begin
             next_state = s59;
             out_next = 4'b0101;
           end
           else if (in == 4'b0001 || in == 4'b0101 || in == 4'b0111 || in == 4'b1000) begin
             next_state = s91;
             out_next = 4'b0011;
           end
           else begin
             next_state = s58;
             out_next = 4'b0000;
           end
      s59: if (in == 4'b0111) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else if (in == 4'b0001 || in == 4'b1000) begin
             next_state = s95;
             out_next = 4'b0111;
           end
           else begin
             next_state = s59;
             out_next = 4'b0101;
           end
      s60: if (in == 4'b0000) begin
             next_state = s61;
             out_next = 4'b1000;
           end
           else if (in == 4'b0001) begin
             next_state = s62;
             out_next = 4'b0111;
           end
           else if (in == 4'b0010) begin
             next_state = s63;
             out_next = 4'b1000;
           end
           else if (in == 4'b0111) begin
             next_state = s64;
             out_next = 4'b0001;
           end
           else if (in == 4'b1000) begin
             next_state = s65;
             out_next = 4'b0000;
           end
           else begin
             next_state = s60;
             out_next = 4'b0101;
           end
      s61: if (in == 4'b0010) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else if (in == 4'b0001 || in == 4'b0111) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else begin
             next_state = s61;
             out_next = 4'b1000;
           end
      s62: if (in == 4'b1000) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else if (in == 4'b0000 || in == 4'b0010) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else begin
             next_state = s62;
             out_next = 4'b0111;
           end
      s63: if (in == 4'b0111) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else if (in == 4'b0000 || in == 4'b0001) begin
             next_state = s95;
             out_next = 4'b0111;
           end
           else begin
             next_state = s63;
             out_next = 4'b1000;
           end
      s64: if (in == 4'b1000) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else if (in == 4'b0000 || in == 4'b0010) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else begin
             next_state = s64;
             out_next = 4'b0001;
           end
      s65: if (in == 4'b0001) begin
             next_state = s95;
             out_next = 4'b0111;
           end
           else if (in == 4'b0010 || in == 4'b0111) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else begin
             next_state = s65;
             out_next = 4'b0000;
           end
      s66: if (in == 4'b0000) begin
             next_state = s67;
             out_next = 4'b1000;
           end
           else if (in == 4'b0001 || in == 4'b0010 || in == 4'b0110 || in == 4'b1000) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else begin
             next_state = s66;
             out_next = 4'b0011;
           end
      s67: if (in == 4'b0110) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else if (in == 4'b0001 || in == 4'b0010) begin
             next_state = s94;
             out_next = 4'b0110;
           end
           else begin
             next_state = s67;
             out_next = 4'b1000;
           end
      s68: if (in == 4'b0000) begin
             next_state = s69;
             out_next = 4'b1000;
           end
           else if (in == 4'b0010) begin
             next_state = s70;
             out_next = 4'b0011;
           end
           else if (in == 4'b0011) begin
             next_state = s71;
             out_next = 4'b0101;
           end
           else if (in == 4'b0101) begin
             next_state = s72;
             out_next = 4'b0011;
           end
           else if (in == 4'b1000) begin
             next_state = s73;
             out_next = 4'b0000;
           end
           else begin
             next_state = s68;
             out_next = 4'b0001;
           end
      s69: if (in == 4'b0101) begin
             next_state = s91;
             out_next = 4'b0011;
           end
           else if (in == 4'b0010 || in == 4'b0011) begin
             next_state = s93;
             out_next = 4'b0101;
           end
           else begin
             next_state = s69;
             out_next = 4'b1000;
           end
      s70: if (in == 4'b0000) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else if (in == 4'b0101 || in == 4'b1000) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else begin
             next_state = s70;
             out_next = 4'b0011;
           end
      s71: if (in == 4'b1000) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else if (in == 4'b0000 || in == 4'b0010) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else begin
             next_state = s71;
             out_next = 4'b0101;
           end
      s72: if (in == 4'b0000) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else if (in == 4'b0010 || in == 4'b0000) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else begin
             next_state = s72;
             out_next = 4'b0011;
           end
      s73: if (in == 4'b0011) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else if (in == 4'b0010 || in == 4'b0101) begin
             next_state = s91;
             out_next = 4'b0011;
           end
           else begin
             next_state = s73;
             out_next = 4'b0000;
           end
      s74: if (in == 4'b0011) begin
             next_state = s75;
             out_next = 4'b0101;
           end
           else if (in == 4'b0001 || in == 4'b0010 || in == 4'b0101 || in == 4'b0111) begin
             next_state = s91;
             out_next = 4'b0011;
           end
           else begin
             next_state = s74;
             out_next = 4'b0000;
           end
      s75: if (in == 4'b0001) begin
             next_state = s95;
             out_next = 4'b0111;
           end
           else if (in == 4'b0010 || in == 4'b0111) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else begin
             next_state = s75;
             out_next = 4'b0101;
           end
      s76: if (in == 4'b0001) begin
             next_state = s77;
             out_next = 4'b0000;
           end
           else if (in == 4'b0000 || in == 4'b0010 || in == 4'b0011 || in == 4'b1000) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else begin
             next_state = s76;
             out_next = 4'b0111;
           end
      s77: if (in == 4'b1000) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else if (in == 4'b0010 || in == 4'b0011) begin
             next_state = s96;
             out_next = 4'b1000;
           end
           else begin
             next_state = s77;
             out_next = 4'b0000;
           end
      s78: if (in == 4'b0000) begin
             next_state = s79;
             out_next = 4'b0110;
           end
           else if (in == 4'b0001 || in == 4'b0010 || in == 4'b0011 || in == 4'b0110) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else begin
             next_state = s78;
             out_next = 4'b1000;
           end
      s79: if (in == 4'b0010) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else if (in == 4'b0001 || in == 4'b0011) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else begin
             next_state = s79;
             out_next = 4'b0110;
           end
      s80: if (in == 4'b0110) begin
             next_state = s81;
             out_next = 4'b0111;
           end
           else if (in == 4'b0000 || in == 4'b0001 || in == 4'b0011 || in == 4'b0111) begin
             next_state = s94;
             out_next = 4'b0110;
           end
           else begin
             next_state = s80;
             out_next = 4'b0010;
           end
      s81: if (in == 4'b0001) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else if (in == 4'b0000 || in == 4'b0011) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else begin
             next_state = s81;
             out_next = 4'b0111;
           end
      s82: if (in == 4'b0000) begin
             next_state = s83;
             out_next = 4'b0011;
           end
           else if (in == 4'b0001 || in == 4'b0010 || in == 4'b0011 || in == 4'b0101) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else begin
             next_state = s82;
             out_next = 4'b1000;
           end
      s83: if (in == 4'b0101) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else if (in == 4'b0001 || in == 4'b0010) begin
             next_state = s93;
             out_next = 4'b0101;
           end
           else begin
             next_state = s83;
             out_next = 4'b0011;
           end
      s84: if (in == 4'b0001) begin
             next_state = s85;
             out_next = 4'b0011;
           end
           else if (in == 4'b0000 || in == 4'b0010 || in == 4'b0011 || in == 4'b0101) begin
             next_state = s89;
             out_next = 4'b0001;
           end
           else begin
             next_state = s84;
             out_next = 4'b0111;
           end
      s85: if (in == 4'b0101) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else if (in == 4'b0000 || in == 4'b0010) begin
             next_state = s93;
             out_next = 4'b0101;
           end
           else begin
             next_state = s85;
             out_next = 4'b0011;
           end
      s86: if (in == 4'b0010) begin
             next_state = s87;
             out_next = 4'b0101;
           end
           else if (in == 4'b0000 || in == 4'b0001 || in == 4'b0011 || in == 4'b0101) begin
             next_state = s90;
             out_next = 4'b0010;
           end
           else begin
             next_state = s86;
             out_next = 4'b0110;
           end
      s87: if (in == 4'b0011) begin
             next_state = s88;
             out_next = 4'b0000;
           end
           else if (in == 4'b0000 || in == 4'b0001) begin
             next_state = s91;
             out_next = 4'b0011;
           end
           else begin
             next_state = s87;
             out_next = 4'b0101;
           end
      s88: begin
             next_state = s88;
             out_next = 4'b0000;
           end
      s89: begin
             next_state = s89;
             out_next = 4'b0001;
           end
      s90: begin
             next_state = s90;
             out_next = 4'b0010;
           end
      s91: begin
             next_state = s91;
             out_next = 4'b0011;
           end
      s92: begin
             next_state = s92;
             out_next = 4'b0100;
           end
      s93: begin
             next_state = s93;
             out_next = 4'b0101;
           end
      s94: begin
             next_state = s94;
             out_next = 4'b0110;
           end
      s95: begin
             next_state = s95;
             out_next = 4'b0111;
           end
      s96: begin
             next_state = s96;
             out_next = 4'b1000;
           end
      default: begin		//Default state in case of corrupted games
                 next_state = s0;
                 out_next = 4'b10010;	//Outside of board
               end
    endcase
  end 	//always
endmodule
