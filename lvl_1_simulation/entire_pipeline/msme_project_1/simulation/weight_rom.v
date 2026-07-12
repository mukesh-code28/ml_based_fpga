module weight_rom
(
    input [31:0] addr,
    output reg signed [15:0] data
);
reg signed [15:0] mem [0:157];
initial begin
    $readmemh("weights.mem",mem);
end
always @(*) begin
    data=mem[addr];
end
endmodule