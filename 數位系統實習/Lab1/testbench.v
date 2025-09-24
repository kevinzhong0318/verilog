//testbench
`include "lab1.v"
`timescale 1ns/1ps

// module testlab1();
// reg A,B,C;
// wire X;
// lab1 DUT (.A(A),.B(B),.C(C),.X(X));
// initial begin
//     $dumpfile("testbench.vcd");
//     $dumpvars(0,testlab1);
// end
// initial #110 $finish;
// initial begin 
//         #0 C=0;//函數產生器CH2未開啟
//         forever begin
//             #10 C=~C;
//             #10 C=~C;
//         end
// end
// initial fork
//     // $monitor("At time %t, A=%b B=%b C=%b : X=%b",$time,A,B,C,X);
//     #0 A=1; 
//     #10A=0;
//     #40 A=1;
//     #80A=0;
// join
// initial fork
//     // $monitor("At time %t, A=%b B=%b C=%b : X=%b",$time,A,B,C,X);
//     #0 B=0;
//     #20 B=1;
//     #40B=0;
//     #60 B=1;
//     #80B=0;
// join

// endmodule //testlab1

`timescale 1 ns/ 1 ps
module lab1_vlg_vec_tst();
// constants                                           
// general purpose registers
reg A;
reg B;
reg C;
// wires                                               
wire X;

// assign statements (if any)                          
lab1 i1 (
// port map - connection between master ports and signals/registers   
	.A(A),
	.B(B),
	.C(C),
	.X(X)
);

initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0,lab1_vlg_vec_tst);
end

// A
initial
begin
	A = 1'b0;
	A = #10000 1'b1;
	A = #10000 1'b0;
	A = #20000 1'b1;
	A = #40000 1'b0;
end 

// B
initial
begin
	B = 1'b0;
	B = #40000 1'b1;
	B = #20000 1'b0;
end 

// C
initial
begin
	C = 1'b0;
	C = #10000 1'b1;
	C = #10000 1'b0;
	C = #10000 1'b1;
	C = #10000 1'b0;
	C = #10000 1'b1;
	C = #10000 1'b0;
	C = #10000 1'b1;
	C = #10000 1'b0;
end 



initial #100 $finish;

endmodule