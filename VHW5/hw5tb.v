`timescale 1ns / 1ns

module testbenchhw5;

integer i;
reg [15:0] CTRWRD, Cin, Din;
wire [15:0] Dout, Adrout;
reg CLK, RESET;
wire V, C, N, Z;

datapath DP1(CTRWRD, Cin, Din, Dout, Adrout, V, C, N, Z, CLK, RESET);

initial CLK = 1'b1;

initial forever begin
    #1 CLK = ~CLK;
end

initial forever begin
    #2
    for(i = 0; i < 8; i = i+1) begin
    $display ("[Time %0t ps] R%0d = %x", $time, i, testbenchhw5.DP1.RF1.R[i]);
    end
    $display (" ");
end

initial begin
    RESET = 1;
    #3 RESET =  0;
    Din = 16'h0001;
    #2 CTRWRD = 16'b0000000000000011;
    Din = 16'h0002;
    #2 CTRWRD = 16'b0010000000000011;
    Din = 16'h0003;
    #2 CTRWRD = 16'b0100000000000011;
    Din = 16'h0004;
    #2 CTRWRD = 16'b0110000000000011;
    Din = 16'h0005;
    #2 CTRWRD = 16'b1000000000000011;
    Din = 16'h0006;
    #2 CTRWRD = 16'b1010000000000011;
    Din = 16'h0007;
    #2 CTRWRD = 16'b1100000000000011;
    Din = 16'h0008;
    #2 CTRWRD = 16'b1110000000000011;
    #2

    Din = 16'hffff;
    #2 CTRWRD = 16'b0010100110010101;
    #2 CTRWRD = 16'b1000101100111001;
    #2 CTRWRD = 16'b1111111100000101;
    #2 CTRWRD = 16'b0010001101001001;
    #2 CTRWRD = 16'b0010000110001000;
    #2 CTRWRD = 16'b1000000110001011;
    #2 CTRWRD = 16'b1010000000101001;
end

initial #200 $finish;

endmodule