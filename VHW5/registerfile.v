module regfile(AA, BA, DA, DD, RW, AD, BD, CLK, RESET);

integer i;
input [2:0] AA, BA, DA; 
input reg [15:0] DD;
input RW, CLK;
output reg [15:0] AD, BD;

reg [15:0] R[0:7];

always @(posedge CLK or negedge RESET) begin
    if(RESET == 1) begin
        for(i = 0; i < 8; i = i + 1) begin
            R[i] <= 16'h0000;
        end
    end
    else begin
        
    end
end

always @(AA or BA or DA) begin
    if(RW == 1) begin
        case (AA)
            3'b000: AD <= R[0];
            3'b001: AD <= R[1];
            3'b010: AD <= R[2];
            3'b011: AD <= R[3];
            3'b100: AD <= R[4];
            3'b101: AD <= R[5];
            3'b110: AD <= R[6];
            3'b111: AD <= R[7];
        case (BA)
            3'b000: BD <= R[0];
            3'b001: BD <= R[1];
            3'b010: BD <= R[2];
            3'b011: BD <= R[3];
            3'b100: BD <= R[4];
            3'b101: BD <= R[5];
            3'b110: BD <= R[6];
            3'b111: BD <= R[7];
        case (DA)
            3'b000: R[0] <= DD;
            3'b001: R[1] <= DD;
            3'b010: R[2] <= DD;
            3'b011: R[3] <= DD;
            3'b100: R[4] <= DD;
            3'b101: R[5] <= DD;
            3'b110: R[6] <= DD;
            3'b111: R[7] <= DD;
    end
end


endmodule