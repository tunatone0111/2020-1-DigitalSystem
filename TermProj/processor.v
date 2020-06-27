module processor(CLK, RESET, Din, Dout, Adrout, MW)

input reg [15:0] Din;

output reg MW;
output [15:0] Adrout, Dout;

wire [3:0] FS;
wire [2:0] DA, AA, BA;
wire MB, MD, RW, MW, PL, JB, BC, V, C, N, Z;

// Registers for PC control & Instruction Fetch
reg [2:0] S;
reg [15:0] PC, INST;

// Instruction memory
reg [15:0] instmem[128];

// Wiring
wire [15:0] CTRWRD = {DA, AA, BA, MB, FS, MD, RW};
wire [15:0] JA = Adrout;

// Module Init
branchcontrol BrC(V, C, N, Z, PL, JB, BC, S);
instructiondecoder ID(INST, DA, AA, BA, MB, FS, MD, RW, MW, PL, JB, BC);
datapath DP(CTRWRD, Cin, Din, Dout, Adrout, V, C, N, Z, CLK, RESET);

// Initialize
initial begin
    PC <= 16'h0000;
    S <= 2'b00;
end

// Instruction Fetch
always @(posedge CLK) begin
    INST <= RESET ? 16'h0000 : instmem[PC];
end

// Program Counter & Branch Control
always @(posedge CLK) begin
    case(S)
        2'b00:
            PC <= PC + 1;
        2'b01:
            PC <= JA;
        2'b10:
            PC <= PC + {10{INST[8]}, INST[8:6], INST[2:0]};
        2'b11:
            PC <= PC + {10{INST[8]}, INST[8:6], INST[2:0]};
    endcase
end


always @(posedge CLK) Cout <= {13'b0000000000000, IR(2:0)};




endmodule