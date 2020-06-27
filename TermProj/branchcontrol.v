module branchcontrol(V, C, N, Z, PL, JB, BC, S)

input V, C, N, Z, PL, JB, BC;
output reg [1:0] S;

S[1] = (PL and JB) or (PL and ~BC and Z);
S[0] = (PL and ~JB) and ((BC and N) or (~BC and Z));

endmodule