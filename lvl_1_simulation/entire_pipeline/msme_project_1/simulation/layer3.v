module layer3
(
    input signed [15:0] y1,
    input signed [15:0] y2,
    input signed [15:0] y3,
    input signed [15:0] y4,
    input signed [15:0] y5,
    input signed [15:0] y6,
    input signed [15:0] w11,
    input signed [15:0] w12,
    input signed [15:0] w13,
    input signed [15:0] w14,
    input signed [15:0] w15,
    input signed [15:0] w16,
    input signed [15:0] w21,
    input signed [15:0] w22,
    input signed [15:0] w23,
    input signed [15:0] w24,
    input signed [15:0] w25,
    input signed [15:0] w26,
    input signed [15:0] w31,
    input signed [15:0] w32,
    input signed [15:0] w33,
    input signed [15:0] w34,
    input signed [15:0] w35,
    input signed [15:0] w36,
    input signed [15:0] b1,
    input signed [15:0] b2,
    input signed [15:0] b3,
    output signed [31:0] out1,
    output signed [31:0] out2,
    output signed [31:0] out3
);

neuron6 n1
(
    .x1(y1),
    .x2(y2),
    .x3(y3),
    .x4(y4),
    .x5(y5),
    .x6(y6),
    .w1(w11),
    .w2(w12),
    .w3(w13),
    .w4(w14),
    .w5(w15),
    .w6(w16),
    .bias(b1),
    .y(out1)
);

neuron6 n2
(
    .x1(y1),
    .x2(y2),
    .x3(y3),
    .x4(y4),
    .x5(y5),
    .x6(y6),
    .w1(w21),
    .w2(w22),
    .w3(w23),
    .w4(w24),
    .w5(w25),
    .w6(w26),
    .bias(b2),
    .y(out2)
);

neuron6 n3
(
    .x1(y1),
    .x2(y2),
    .x3(y3),
    .x4(y4),
    .x5(y5),
    .x6(y6),
    .w1(w31),
    .w2(w32),
    .w3(w33),
    .w4(w34),
    .w5(w35),
    .w6(w36),
    .bias(b3),
    .y(out3)
);

endmodule