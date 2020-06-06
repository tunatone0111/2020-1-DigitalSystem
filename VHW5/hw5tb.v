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
    Din = 16'h92a1;
    #3 RESET =  0;
    #2 CTRWRD = 16'b0000000000000011;
    #2
    #2 CTRWRD = 16'b0100000000000011;
    #2 CTRWRD = 16'b1000000000000011;
    #2 CTRWRD = 16'b0000000000000011;
end

initial #200 $finish;

endmodule