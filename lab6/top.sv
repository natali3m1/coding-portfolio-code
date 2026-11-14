module top(
    input logic [5:0] A,
    output logic y1,
    output logic y2,
    output logic [6:0] SEG
);

logic clk;


logic [25:0] count;
logic [6:0] msb;
logic [6:0] lsb;

SB_HFOSC #(
    .CLKHF_DIV("0b00")
) osc (
    .CLKHFPU(1'b1),
    .CLKHFEN(1'b1),
    .CLKHF(clk)
);

dddd ustuff(.in(A), .msb(msb), .lsb(lsb));

//alternate between the two

counter ucount(.clk(clk), .out(count));

assign y1 = count[15];
assign y2 = ~count[15];

always_comb begin
    if (count[15] == 1'b1) begin
        SEG = msb;
    end
    else begin
        SEG = lsb;
    end
end

endmodule