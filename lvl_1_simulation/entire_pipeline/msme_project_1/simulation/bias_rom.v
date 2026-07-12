module bias_rom
(
    input [4:0] addr,
    output reg signed [15:0] data
);
reg signed [15:0] mem [0:18];
initial
begin
    $readmemh("biases.mem", mem);
end
always @(*)
begin
    data=mem[addr];
end
endmodule