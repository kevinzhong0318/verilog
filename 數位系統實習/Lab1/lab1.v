module lab1 (A,B,C,X);
input  A,B,C;
output X;
wire D,E;

and g1(D,A,B);
and g2(E,A,C);
or g3(X,D,E); 
endmodule //lab1
//X=A(B+C)


