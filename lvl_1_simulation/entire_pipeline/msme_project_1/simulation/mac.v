module mac
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

assign y = ((x1*w1)+(x2*w2)+(x3*w3)+(x4*w4)+(x5*w5)+(x6*w6)+(x7*w7)+(x8*w8)+bias)/1000;

endmodule