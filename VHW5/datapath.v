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

reg [15:0] busA, busB1, busD1, busB2, busD2;

output V, C, N, Z;
output [15:0] Adrout, Dout;
assign Adrout = busA;
assign Dout = busB2;

regfile RF1(AA, BA, DA, busD2, RW, busA, busB1, CLK, RESET);
funcunit FU1(FS, busA, busB2, busD1, V, C, N, Z, CLK, RESET);

always @(posedge CLK) begin
    busD2 <= MD ? Din : busD1;
    busB2 <= MB ? Cin : busB1;
end

endmodule