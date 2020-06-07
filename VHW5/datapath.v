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

reg [15:0] busA, busB, busD;

output V, C, N, Z;
output [15:0] Adrout, Dout;

regfile RF1(AA, BA, DA, busD, RW, busA, busB, CLK, RESET);
funcunit FU1(FS, busA, busB, busD, V, C, N, Z, CLK, RESET);

always @(posedge CLK) begin
    busD <= MD ? Din : busD;
    busB <= MB ? Cin : busB;
    Adrout <= busA;
    Dout <= busB;
end

endmodule