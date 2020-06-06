module funcunit(FS, A, B, D, V, C, N, Z, CLK, RESET);

input CLK, RESET;
input [3:0] FS;
input [15:0] A, B;
output V, C, N, Z;
output reg [15:0] D;

always @(posedge CLK) begin
    if(RESET == 1) D = 16'h0000;
    else begin
        V
        C
        N
        Z
        case(FS)
            2'b0000:begin
                D <= A;
            end
            2'b0001:begin
                D <= A+1;
            end
            2'b0010:begin
                D <= A+B;
            end
            2'b0011:begin
                D <= A+B+1;
            end
            2'b0100:begin
                //A+~B
                D <= A+~B;
            end
            2'b0101:begin
                //A+~B+1
                D <= A+~B+1;
            end
            2'b0110:begin
                //A-1
                D <= A-1;
            end
            2'b0111:begin
                D <= A
            end
            2'b1000:begin
                D <= A & B;
            end
            2'b1001:begin
                D <= A | B;
            end
            2'b1010:begin
                D <= A ^ B;
            end
            2'b1011:begin
                D <= ~A;
            end
            2'b1100:begin
                D <= B;
            end
            2'b1101:begin
                D <= B>>1;
            end
            2'b1110:begin
                D <= B<<1;
            end
            2'b1111:begin
                D <= D;
            end
        endcase
    end
end

endmodule;