module dddd(
    input logic [5:0] in,
    output logic [6:0] msb,
    output logic [6:0] lsb
);

logic [3:0] lowBCD;
logic [12:0] tensplace;
logic [3:0] highBCD;

assign lowBCD = 4'(in % 6'd10);
assign tensplace = in*6'd52;
assign highBCD = tensplace[12:9];

sevseg sevh(.D(highBCD), .S(msb));
sevseg sevl(.D(lowBCD), .S(lsb));

endmodule