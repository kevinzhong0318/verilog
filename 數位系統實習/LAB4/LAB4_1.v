//4 bit CLA
module LAB4_1 (input [3:0] A,input [3:0] B,input C0,output [3:0] S,output C4 );
    reg [3:0] P;
    reg [3:0] G;
    integer i;
    wire C1,C2,C3;

    always @(*) begin
        for (i=0;i<4;i=i+1) begin
            P[i] = A[i] ^ B[i];
            G[i] = A[i] & B[i];
        end
    end//HA4顆

    assign S[0] = P[0] ^ C0;
    assign S[1] = P[1] ^ C1;
    assign S[2] = P[2] ^ C2;
    assign S[3] = P[3] ^ C3;

    assign C1= P[0]&C0 | G[0];
    assign C2= P[1]&C1 | G[1] | P[1]&P[0]&C0;
    assign C3= P[2]&C2 | G[2] | P[2]&P[1]&G[0] | P[2]&P[1]&P[0]&C0;
    assign C4= G[3] | P[3]&G[2] | P[3]&P[2]&G[1] | P[3]&P[2]&P[1]&G[0] | P[3]&P[2]&P[1]&P[0]&C0; 

endmodule //LAB4_1