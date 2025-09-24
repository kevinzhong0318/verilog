module full_adder (
    A,B,C0,C1,S
);
    input A,B,C0;
    output C1,S;

    assign S=A^B^C0;
    assign C1=(A&B)|(B&C0)|(C0&A);
endmodule //full_adder