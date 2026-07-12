module layer1
(
    input signed [15:0] x1,
    input signed [15:0] x2,
    input signed [15:0] x3,
    input signed [15:0] x4,
    input signed [15:0] x5,
    input signed [15:0] x6,
    input signed [15:0] x7,
    input signed [15:0] x8,

    input signed [15:0] w11,w12,w13,w14,w15,w16,w17,w18,
    input signed [15:0] w21,w22,w23,w24,w25,w26,w27,w28,
    input signed [15:0] w31,w32,w33,w34,w35,w36,w37,w38,
    input signed [15:0] w41,w42,w43,w44,w45,w46,w47,w48,
    input signed [15:0] w51,w52,w53,w54,w55,w56,w57,w58,
    input signed [15:0] w61,w62,w63,w64,w65,w66,w67,w68,
    input signed [15:0] w71,w72,w73,w74,w75,w76,w77,w78,
    input signed [15:0] w81,w82,w83,w84,w85,w86,w87,w88,
    input signed [15:0] w91,w92,w93,w94,w95,w96,w97,w98,
    input signed [15:0] w101,w102,w103,w104,w105,w106,w107,w108,

    input signed [15:0] b1,
    input signed [15:0] b2,
    input signed [15:0] b3,
    input signed [15:0] b4,
    input signed [15:0] b5,
    input signed [15:0] b6,
    input signed [15:0] b7,
    input signed [15:0] b8,
    input signed [15:0] b9,
    input signed [15:0] b10,

    output signed [31:0] y1,
    output signed [31:0] y2,
    output signed [31:0] y3,
    output signed [31:0] y4,
    output signed [31:0] y5,
    output signed [31:0] y6,
    output signed [31:0] y7,
    output signed [31:0] y8,
    output signed [31:0] y9,
    output signed [31:0] y10
);

neuron n1
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5),
    .x6(x6),
    .x7(x7),
    .x8(x8),
    .w1(w11),
    .w2(w12),
    .w3(w13),
    .w4(w14),
    .w5(w15),
    .w6(w16),
    .w7(w17),
    .w8(w18),
    .bias(b1),
    .y(y1)
);

neuron n2
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5),
    .x6(x6),
    .x7(x7),
    .x8(x8),
    .w1(w21),
    .w2(w22),
    .w3(w23),
    .w4(w24),
    .w5(w25),
    .w6(w26),
    .w7(w27),
    .w8(w28),
    .bias(b2),
    .y(y2)
);

neuron n3
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5),
    .x6(x6),
    .x7(x7),
    .x8(x8),
    .w1(w31),
    .w2(w32),
    .w3(w33),
    .w4(w34),
    .w5(w35),
    .w6(w36),
    .w7(w37),
    .w8(w38),
    .bias(b3),
    .y(y3)
);

neuron n4
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5),
    .x6(x6),
    .x7(x7),
    .x8(x8),
    .w1(w41),
    .w2(w42),
    .w3(w43),
    .w4(w44),
    .w5(w45),
    .w6(w46),
    .w7(w47),
    .w8(w48),
    .bias(b4),
    .y(y4)
);

neuron n5
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5),
    .x6(x6),
    .x7(x7),
    .x8(x8),
    .w1(w51),
    .w2(w52),
    .w3(w53),
    .w4(w54),
    .w5(w55),
    .w6(w56),
    .w7(w57),
    .w8(w58),
    .bias(b5),
    .y(y5)
);

neuron n6
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5),
    .x6(x6),
    .x7(x7),
    .x8(x8),
    .w1(w61),
    .w2(w62),
    .w3(w63),
    .w4(w64),
    .w5(w65),
    .w6(w66),
    .w7(w67),
    .w8(w68),
    .bias(b6),
    .y(y6)
);

neuron n7
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5),
    .x6(x6),
    .x7(x7),
    .x8(x8),
    .w1(w71),
    .w2(w72),
    .w3(w73),
    .w4(w74),
    .w5(w75),
    .w6(w76),
    .w7(w77),
    .w8(w78),
    .bias(b7),
    .y(y7)
);

neuron n8
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5),
    .x6(x6),
    .x7(x7),
    .x8(x8),
    .w1(w81),
    .w2(w82),
    .w3(w83),
    .w4(w84),
    .w5(w85),
    .w6(w86),
    .w7(w87),
    .w8(w88),
    .bias(b8),
    .y(y8)
);

neuron n9
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5),
    .x6(x6),
    .x7(x7),
    .x8(x8),
    .w1(w91),
    .w2(w92),
    .w3(w93),
    .w4(w94),
    .w5(w95),
    .w6(w96),
    .w7(w97),
    .w8(w98),
    .bias(b9),
    .y(y9)
);

neuron n10
(
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5),
    .x6(x6),
    .x7(x7),
    .x8(x8),
    .w1(w101),
    .w2(w102),
    .w3(w103),
    .w4(w104),
    .w5(w105),
    .w6(w106),
    .w7(w107),
    .w8(w108),
    .bias(b10),
    .y(y10)
);

endmodule