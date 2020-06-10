`timescale 1ns / 1ns

module testbenchhw5;

integer i;
reg [15:0] CTRWRD, Cin, Din;
wire [15:0] Dout, Adrout;
reg CLK, RESET;
wire [0:3] status_bits;
parameter PERIOD = 2;

datapath DP1(CTRWRD, Cin, Din, Dout, Adrout, status_bits[0], status_bits[1], status_bits[2], status_bits[3], CLK, RESET);

initial CLK = 1'b1;

initial forever begin
    #1 CLK = ~CLK;
end

initial forever begin
    #2
    $display ("[Time %0t ps] %3b %3b %3b", $time, testbenchhw5.DP1.DA, testbenchhw5.DP1.AA, testbenchhw5.DP1.BA);
    for(i = 0; i < 8; i = i+1) begin
    $display ("[Time %0t ps] R%0d = %x, dec:%d, signed:%d", $time, i, testbenchhw5.DP1.RF1.R[i], testbenchhw5.DP1.RF1.R[i], $signed(testbenchhw5.DP1.RF1.R[i]));
    end
end

initial begin
    RESET = 1;
    Cin = 16'h0002;
    Din = 16'h0000;
    CTRWRD = 16'b0000000000000011;
    #PERIOD
    RESET =  0;
    #PERIOD Din = 16'h0001;
    CTRWRD = 16'b0010000000000011;
    #PERIOD Din = 16'h0002;
    CTRWRD = 16'b0100000000000011;
    #PERIOD Din = 16'h0003;
    CTRWRD = 16'b0110000000000011;
    #PERIOD Din = 16'h0004;
    CTRWRD = 16'b1000000000000011;
    #PERIOD Din = 16'h0005;
    CTRWRD = 16'b1010000000000011;
    #PERIOD Din = 16'h0006;
    CTRWRD = 16'b1100000000000011;
    #PERIOD Din = 16'h0007;
    CTRWRD = 16'b1110000000000011;

    #PERIOD
    CTRWRD = 16'b0000000000000000;
    Din = 16'h0012;

    #PERIOD CTRWRD = 16'b0010100110010101;
    #PERIOD CTRWRD = 16'b1000001100111001;
    #PERIOD CTRWRD = 16'b1111110000000101;
    #PERIOD CTRWRD = 16'b0010000001001001;
    #PERIOD CTRWRD = 16'b0000000110000000;
    #PERIOD CTRWRD = 16'b1000000000000011;
    #PERIOD CTRWRD = 16'b1010000000101001;
    #PERIOD Din = 16'hefff;
    CTRWRD = 16'b0000000000000011;
    #PERIOD Din = 16'heffe;
    CTRWRD = 16'b0010000000000011;
    #PERIOD CTRWRD = 16'b0100000010001001;
end

initial #50 $finish;

endmodule