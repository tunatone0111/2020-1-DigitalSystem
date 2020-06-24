module funcunit(FS, A, B, D, V, C, N, Z, CLK, RESET);

input CLK, RESET;
input [3:0] FS;
input [15:0] A, B;
reg C1;
output reg V, C, N, Z;
output reg [15:0] D;

always @(A or B) begin
    if(RESET == 1) D <= 16'h0000;
    else begin
        case(FS)
            4'b0000:begin
                {C1, D[14:0]} <= A[14:0];
                {C, D} <= A;
            end
            4'b0001:begin
                {C1, D[14:0]} <= A[14:0] + 1;
                {C, D} <= A + 1;
            end
            4'b0010:begin
                {C1, D[14:0]} <= A[14:0] + B[14:0];
                {C, D} <= A + B;
            end
            4'b0011:begin
                {C1, D[14:0]} <= A[14:0] + B[14:0] + 1;
                {C, D} <= A + B + 1;
            end
            4'b0100:begin
                {C1, D[14:0]} <= A[14:0] + ~B[14:0];
                {C, D} <= A + ~B;
            end
            4'b0101:begin
                {C1, D[14:0]} <= A[14:0] + ~B[14:0] + 1;
                {C, D} <= A + ~B + 1;
            end
            4'b0110:begin
                {C1, D[14:0]} <= A[14:0] - 1;
                {C, D} <= A - 1;
            end
            4'b0111:begin
                {C1, D[14:0]} <= A[14:0];
                {C, D} <= A;
            end
            4'b1000: D <= A & B;
            4'b1001: D <= A | B;
            4'b1010: D <= A ^ B;
            4'b1011: D <= ~A;
            4'b1100: D <= B;
            4'b1101: D <= B>>1;
            4'b1110: D <= B<<1;
            4'b1111: D <= D;
        endcase
    end
end

always @(posedge CLK or D or C1 or C) begin
    if(RESET == 1) {V, C, N, Z, C1} <= 5'b00000;
    else begin
        if(D == 16'h0000) Z <= 1;
        else Z <= 0;
        N <= D[15];
        V <= C1 ^ C;
    end
end

endmodule;