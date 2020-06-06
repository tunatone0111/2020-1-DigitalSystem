module funcunit(FS, A, B, D, V, C, N, Z, CLK, RESET);

input CLK, RESET;
input [3:0] FS;
input [15:0] A, B;
reg [16:0] temp;
output reg V, C, N, Z;
output reg [15:0] D;

always @(posedge CLK) begin
    if(RESET == 1) D = 16'h0000;
    else begin
        case(FS)
            4'b0000:begin
                {C, D} <= A;
            end
            4'b0001:begin
                {C, D} <= A + 1;
            end
            4'b0010:begin
                {C, D} <= A+B;
            end
            4'b0011:begin
                {C, D} <= A+B+1;
            end
            4'b0100:begin
                {C, D} <= A+~B;
            end
            4'b0101:begin
                {C, D} <= A+~B+1;
            end
            4'b0110:begin
                {C, D} <= A-1;
            end
            4'b0111:begin
                {C, D} <= A;
            end
            4'b1000:begin
                D <= A & B;
            end
            4'b1001:begin
                D <= A | B;
            end
            4'b1010:begin
                D <= A ^ B;
            end
            4'b1011:begin
                D <= ~A;
            end
            4'b1100:begin
                D <= B;
            end
            4'b1101:begin
                D <= B>>1;
            end
            4'b1110:begin
                D <= B<<1;
            end
            4'b1111:begin
                D <= D;
            end
        endcase

        if(D == 4'h0000) Z = 1;
        else Z = 0;

        N <= D[15];
        V <= D[15] ^ C;
    end
end

endmodule;