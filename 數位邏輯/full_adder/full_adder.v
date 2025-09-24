module Prob_6_54 (output reg [3:0] SR_A, input Shift_control, SI, CLK, Clear_b);
  reg [3:0] SR_B;
  wire S;
  wire Q;
  wire SI_A = S;
  wire SO_A = SR_A[0];
  wire SO_B = SR_B[0];
  wire SI_B = SI;
  and (J_in, SO_A, SO_B);
  nor (K_in, SO_A, SO_B);
  xor (S, SO_A, SO_B, Q);
  //
  always @ (posedge CLK)
    if (Clear_b == 1'b0) SR_A<= 4'b0; 
else if (Shift_control) SR_A <= {SI_A, SR_A[3:1]};
  always @ (posedge CLK)
    if (Clear_b == 1'b0) SR_B <= 4'b0; 
else if (Shift_control) SR_B <= {SI_B, SR_B[3:1]};
  // gated clock
  and (clk_to_JKFF, CLK, Shift_control);		
  JKFF M1 (Q, J_in, K_in, clk_to_JKFF, Clear_b);
endmodule

// module FA (output S, C, input x, y, z);
//   assign {C, S} = x + y + z;
// endmodule
module JKFF (output reg Q, input J_in, K_in, C, Clear_b);
  always @ (posedge C) if (Clear_b == 1'b0) Q <= 1'b0; else
    case ({J_in, K_in})
      2'b00:		Q <= Q;
      2'b01:		Q <= 1'b0;
      2'b10:		Q <= 1'b1;
      2'b11:		Q <= !Q;
    endcase
endmodule

module t_Prob_6_54 ();
  wire [3:0] SR_A;
  reg Shift_control, SI, CLK, Clear_b;
  //
  Prob_6_54 M0 (SR_A, Shift_control, SI, CLK, Clear_b);
  initial #400 $finish;			// sequence of 3s
  initial begin CLK = 0; forever #5 CLK = ~CLK; end
  initial fork
     Clear_b = 0;			
    #20 Clear_b = 1;		
    #40 Shift_control = 0;
    #145 Shift_control = 1;
    #225 Shift_control = 0;
    SI = 0;   // Serial input to SRB
    #100 SI = 1;
    // #120 SI = 0;
    // #140 SI = 1;
    // #160 SI = 0;
    // #180 SI = 1;
    // #200 SI = 0;
    $dumpfile("dump.vcd");
    $dumpvars(0,t_Prob_6_54);
  join
endmodule