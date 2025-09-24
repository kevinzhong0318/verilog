module LAB2_1(X1,X2,X3,X4,g,f,h);
    input X1,X2,X3,X4;
    output g,f,h;
    wire w1,w2,w3,w4;

    assign w1 = X1 & X2;
    assign w2 = X1 & X2;
    assign w3 = X3 | X4;
    assign w4 = X3 | X4;
    assign g = w1 | w2;
    assign h = w3 & w4;
    assign f = g & h;

endmodule