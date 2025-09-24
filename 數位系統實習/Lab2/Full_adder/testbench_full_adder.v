`include "full_adder.v"
`timescale 1ns/1ps

module testbench_full_adder;

reg a, b, cin;
wire sum, cout;

// Instantiate the full adder module
full_adder uut (
    .A(a),
    .B(b),
    .C0(cin),
    .S(sum),
    .C1(cout)
);


initial begin
    $display("a b cin | sum cout");
    $display("---------------");
    // Test all input combinations
    a = 0; b = 0; cin = 0; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a = 0; b = 0; cin = 1; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a = 0; b = 1; cin = 0; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a = 0; b = 1; cin = 1; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a = 1; b = 0; cin = 0; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a = 1; b = 0; cin = 1; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a = 1; b = 1; cin = 0; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    a = 1; b = 1; cin = 1; #10;
    $display("%b %b  %b  |  %b   %b", a, b, cin, sum, cout);

    $finish;
end

initial begin
    $dumpfile("testbench_full_adder.vcd");
    $dumpvars(0, testbench_full_adder);
end

endmodule