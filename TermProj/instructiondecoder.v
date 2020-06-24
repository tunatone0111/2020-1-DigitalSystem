module instructiondecoder(INST, DA, AA, BA, MB, FS, MD, RW, MW, PL, JB, BC)

input [15:0] INST;
output [3:0] FS;
output [2:0] DA, AA, BA;
output MB, MD, RW, MW, PL, JB, BC;

assign DA = INST[8:6];
assign AA = INST[5:3];
assign BA = INST[2:0];

assign MB = INST[15];
assign MD = INST[13];
assign RW = ~INST[14];
assign MW = INST[14] and ~INST[15]);
assign PL = INST[14] and INST[15]);
assign JB = INST[13];
assign BC = INST[9];

assign FS = {INST[12:10], INST[9] and ~PL)};

end