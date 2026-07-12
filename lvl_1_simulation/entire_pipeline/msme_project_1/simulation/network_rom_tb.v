module network_rom_tb;
reg signed [15:0] x1;
reg signed [15:0] x2;
reg signed [15:0] x3;
reg signed [15:0] x4;
reg signed [15:0] x5;
reg signed [15:0] x6;
reg signed [15:0] x7;
reg signed [15:0] x8;
wire signed [31:0] out1;
wire signed [31:0] out2;
wire signed [31:0] out3;
network_rom uut
(
.x1(x1),
.x2(x2),
.x3(x3),
.x4(x4),
.x5(x5),
.x6(x6),
.x7(x7),
.x8(x8),
.out1(out1),
.out2(out2),
.out3(out3)
);
reg [1:0] predicted_class;
initial begin
x1=0;
x2=0;
x3=0;
x4=0;
x5=0;
x6=0;
x7=0;
x8=0;
#10;



/*Add features here*/


x1 = 16'sd1805;
x2 = 16'sd1805;
x3 = 16'sd2481;
x4 = 16'sd1561;
x5 = 16'sd1760;
x6 = -16'sd672;
x7 = 16'sd1309;
x8 = 16'sd1351;

/*End of features*/



#20;

/*For debugging purpose*/
/*Only developers access*/

/*$display("Neuron1 MAC=%d, ReLU=%d",uut.L1.n1.mac_out,uut.y1);
$display("Neuron2 MAC=%d, ReLU=%d",uut.L1.n2.mac_out,uut.y2);
$display("Neuron3 MAC=%d, ReLU=%d",uut.L1.n3.mac_out,uut.y3);
$display("Neuron4 MAC=%d, ReLU=%d",uut.L1.n4.mac_out,uut.y4);
$display("\ny1=%d",uut.y1);
$display("y2=%d",uut.y2);
$display("y3=%d",uut.y3);
$display("y4=%d",uut.y4);
$display("y5=%d",uut.y5);
$display("y6=%d",uut.y6);
$display("y7=%d",uut.y7);
$display("y8=%d",uut.y8);
$display("y9=%d",uut.y9);
$display("y10=%d\n",uut.y10);
$display("z1=%d",uut.z1);
$display("z2=%d",uut.z2);
$display("z3=%d",uut.z3);
$display("z4=%d",uut.z4);
$display("z5=%d",uut.z5);
$display("z6=%d\n",uut.z6);*/

/*Output window*/

$display("out1=%d",out1);
$display("out2=%d",out2);
$display("out3=%d\n\n",out3);
    #30;
    if (out1>out2 && out1>out3)
        predicted_class=0;
    else if (out2>out1 && out2>out3)
        predicted_class=1;
    else
        predicted_class=2;
    case(predicted_class)
        0: $display("PREDICTED SHAPE = TRIANGLE");
        1: $display("PREDICTED SHAPE = SQUARE");
        2: $display("PREDICTED SHAPE = CIRCLE");
        default: $display("UNKNOWN SHAPE");
    endcase
$finish;
end
endmodule