module Problem_6_58a(output A3, A2, A1, A0, C_out, input I3, I2, I1, I0, Count, Load, CLK, Clear_b);
  not (Load_bar, Load);
  not (I0_bar, I0);
  not (I1_bar, I1);
  not (I2_bar, I2);
  not (I3_bar, I3);
  and (w0, Count, Load_bar); 	// w0=CL・
  and (w1, Load, I0);        	//w1=L I0
  and (w2, Load, I0_bar);     	// w2=L I0・
  and (w3, Load, I1);        	// w3= L I1
  and (w4, Load, I1_bar);    	//w4=L I1・
  and (w5, Load, I2);        	// w5=L I2
  and (w6, Load, I2_bar);     	// w6=L I2・ 
  and (w7, Load, I3);        	//w7=L I3
  and (w8, Load, I3_bar);     	//w8=L I3・
//
  and (w17, w0, A0);           // w17= CL・*A0 (See Fig. 6.14 in PPT)
  and (w18, w0, A0, A1);       // w18= CL・*A0*A1
  and (w19, w0, A0, A1, A2);    // w19= CL・*A0*A1*A2
  and (C_out, w0, A0, A1, A2, A3); // C_out= CL・*A0*A1*A2*A3
  //
or ( w9, w1, w0);          //w9=w1+w0= L I0 + CL・
  or ( w10, w2, w0);         //w10=w2+w0
  or ( w11, w3, w17);        //w11=w3+w0 A0 = LI1+ CL・*A0
  or ( w12, w4, w17);        //w12=w4+w0 A0
  or ( w13, w5, w18);        //w13=w5+w18
  or ( w14, w6, w18);        //w14=w6+w18
  or ( w15, w7, w19);        //w15=w7+w19= L I3+ CL・*A0*A1*A2
  or ( w16, w8, w19);        //w16=w8+w19 =L I3・+ CL・*A0*A1*A2
  //`
  JKFF M0 (A0, w9, w10, CLK, Clear_b);  
  JKFF M1 (A1, w11, w12, CLK, Clear_b);
  JKFF M2 (A2, w13, w14, CLK, Clear_b);
  JKFF M3 (A3, w15, w16, CLK, Clear_b);
endmodule

module JKFF (output reg Q, input J_in, K_in, C, Clear_b);
  always @ (posedge C) if (Clear_b == 1'b0) Q <= 0; else 
    case ({J_in, K_in})
      2'b00:		Q <= Q; // trivial since reg Q
      2'b01:		Q <= 1'b0;
      2'b10:		Q <= 1'b1;
      2'b11:		Q <= !Q;
    endcase
endmodule

module t_Problem_6_58a();
  wire A3, A2, A1, A0, C_out;
  reg I3, I2, I1, I0, Count, Load, CLK, Clear_b;
  wire [3:0] value = {A3, A2, A1, A0};
  wire [3:0] Par_word = {I3, I2, I1, I0};
  Problem_6_58a M0 (A3, A2, A1, A0, C_out, I3, I2, I1, I0, Count, Load, CLK, Clear_b);
  initial #400 $finish;
  initial begin CLK = 0; forever #5 CLK = !CLK; end
  initial fork
    {I3, I2, I1, I0} = 4'b0101;	// Data for parallel load; 0101=5
    Clear_b = 0;
    Count = 0;
    Load = 0;
    #20 Clear_b = 1;
    #50 Count = 1;		// Counting
    #150 Count = 0;	   // Pause
    #200 Count = 1;	   // Resume counting
    #250 Load = 1;	   // Parallel load
    #260 Load = 0;
    $dumpfile("dump.vcd");
    $dumpvars(0,t_Problem_6_58a);
  join
endmodule