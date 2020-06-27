module datapath(CTRWRD, Cin, Din, Dout, Adrout, V, C, N, Z, CLK, RESET);

input CLK, RESET;

input [15:0] CTRWRD, Cin, Din;
wire [3:0] FS;
wire [2:0] DA, AA, BA;
wire MB, MD, RW;
assign DA = CTRWRD[15:13];
assign AA = CTRWRD[12:10];
assign BA = CTRWRD[9:7];
assign MB = CTRWRD[6];
assign FS = CTRWRD[5:2];
assign MD = CTRWRD[1];
assign RW = CTRWRD[0];

wire [15:0] wireA, wireB, wireD;
reg [15:0] busA, busB, busD;

output V, C, N, Z;
output [15:0] Adrout, Dout;
assign Adrout = busA;
assign Dout = busB;

regfile RF1(AA, BA, DA, busD, RW, wireA, wireB, CLK, RESET);
funcunit FU1(FS, busA, busB, wireD, V, C, N, Z, CLK, RESET);

always @(*) begin
    busA <= wireA;
    busB <= MB ? Cin : wireB;
end

always @(*) begin
    busD <= MD ? Din : wireD;
end

endmodule