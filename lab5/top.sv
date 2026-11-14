module top (
    input logic [3:0] A,
    input logic [3:0] B,
    input logic [1:0] S,
    output logic [6:0] SEG
);
    logic [3:0] result;
    alu my_alu (
        .a(A),
        .b(B),
        .s(S),
        .y(result)
    );
    sevseg my_display (
        .D(result),
        .S(SEG)
    );
endmodule
