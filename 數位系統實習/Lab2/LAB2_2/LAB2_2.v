//乘法器製作
module half_adder (X,Y,S,C);
    input X,Y;
    output S,C;

    assign S=X^Y;      
    assign C= X&Y;   
endmodule

module LAB2_2 (A,B,C);
    input [1:0]A,B;
    output [3:0]C;
    wire w1,w2,w_carry;

    assign C[0] = A[0] & B[0];
    assign w1 = A[0] & B[1];
    assign w2 = A[1] & B[0];
    assign w3 = A[1] & B[1];
    half_adder M1(.X(w1), .Y(w2), .S(C[1]), .C(w_carry));
    half_adder M2(.X(w3), .Y(w_carry), .S(C[2]), .C(C[3]));
endmodule //LAB2_2