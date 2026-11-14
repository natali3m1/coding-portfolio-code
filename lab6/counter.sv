module counter(
    input logic clk,
    output logic [25:0] out = 26'b0
);

always_ff @(posedge clk) begin
    if (out==(26'd67108863))begin
         out <= 26'b0;
    end
    else begin
        out <= out + 1'b1;
    end
end
endmodule
