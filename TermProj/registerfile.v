module regfile(AA, BA, DA, DD, RW, AD, BD, CLK, RESET);

input [2:0] AA, BA, DA; 
input [15:0] DD;
input RW, CLK, RESET;
output reg [15:0] AD, BD;
reg [15:0] R[0:7];
reg [2:0] DAtemp;
reg RWtemp;

always @(posedge CLK) begin
    if(RESET == 1) begin
        R[0] <= 16'h0000;
        R[1] <= 16'h0000;
        R[2] <= 16'h0000;
        R[3] <= 16'h0000;
        R[4] <= 16'h0000;
        R[5] <= 16'h0000;
        R[6] <= 16'h0000;
        R[7] <= 16'h0000;
        DAtemp <= 16'h0000;
        AD <= 16'h0000;
        BD <= 16'h0000;
    end
    else begin
        case (AA)
            3'b000: AD <= R[0];
            3'b001: AD <= R[1];
            3'b010: AD <= R[2];
            3'b011: AD <= R[3];
            3'b100: AD <= R[4];
            3'b101: AD <= R[5];
            3'b110: AD <= R[6];
            3'b111: AD <= R[7];
        endcase

        case (BA)
            3'b000: BD <= R[0];
            3'b001: BD <= R[1];
            3'b010: BD <= R[2];
            3'b011: BD <= R[3];
            3'b100: BD <= R[4];
            3'b101: BD <= R[5];
            3'b110: BD <= R[6];
            3'b111: BD <= R[7];
        endcase

        case (DAtemp)
            3'b000: R[0] <= RWtemp ? DD : R[0];
            3'b001: R[1] <= RWtemp ? DD : R[1];
            3'b010: R[2] <= RWtemp ? DD : R[2];
            3'b011: R[3] <= RWtemp ? DD : R[3];
            3'b100: R[4] <= RWtemp ? DD : R[4];
            3'b101: R[5] <= RWtemp ? DD : R[5];
            3'b110: R[6] <= RWtemp ? DD : R[6];
            3'b111: R[7] <= RWtemp ? DD : R[7];
        endcase
    end
end

always @(R or DA or RW) begin
    DAtemp <= DA;
    RWtemp <= RW;
end

endmodule