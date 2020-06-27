module branchcontrol(V, C, N, Z, PL, JB, BC, S);

input V, C, N, Z, PL, JB, BC;
output wire [1:0] S;

assign S[1] = (PL & JB) | (PL & ~BC & Z);
assign S[0] = (PL & ~JB) & ((BC & N) | (~BC & Z));

endmodule