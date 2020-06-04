`timescale 1ns / 1ns

module testbenchhw5;

reg [15:0] CTRWRD;
reg CLK, RESET;
wire [3:0] FS;
wire [2:0] DA, AA, BA;
wire MB, MD, RW;
wire [15:0] busA, busB, busD, Cin, Din, Dout, Adrout;
DA = CTRWRD[15:13];
AA = CTRWRD[12:10];
BA = CTRWRD[9:7];
MB = CTRWRD[6];
FS = CTRWRD[5:2];
MD = CTRWRD[1];
RW = CTRWRD[0];

regfile RF1(AA, BA, DA, busD, RW, busA, busB, CLK, RESET);

initial CLK = 1'b1;
initial forever begin
    #1 CLK = ~CLK;
end

always @(posedge CLK) begin

end

initial begin
    
end