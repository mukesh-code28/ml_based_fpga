module neuron
(
    input signed [15:0] x1,
    input signed [15:0] x2,
    input signed [15:0] x3,
    input signed [15:0] x4,
    input signed [15:0] x5,
    input signed [15:0] x6,
    input signed [15:0] x7,
    input signed [15:0] x8,
    input signed [15:0] w1,
    input signed [15:0] w2,
    input signed [15:0] w3,
    input signed [15:0] w4,
    input signed [15:0] w5,
    input signed [15:0] w6,
    input signed [15:0] w7,
    input signed [15:0] w8,
    input signed [15:0] bias,
    output signed [31:0] y
);
wire signed [31:0] mac_out;
mac u1
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5),
    .x6(x6),
    .x7(x7),
    .x8(x8),
    .w1(w1),
    .w2(w2),
    .w3(w3),
    .w4(w4),
    .w5(w5),
    .w6(w6),
    .w7(w7),
    .w8(w8),
    .bias(bias),
    .y(mac_out)
);
relu u2
(
    .data_in(mac_out),
    .data_out(y)
);
endmodule