`timescale 1ns / 1ns

module testbenchhw6;

reg CLK, RESET;
parameter PERIOD = 2;

computer C1(CLK, RESET);

initial CLK = 1'b1;

initial forever begin
    #1 CLK = ~CLK;
end

initial begin
    //My initialization
    //LDI R3, 9
    C1.P1.instmem[0] <= {7'b1001100, 3'd3, 3'd0, 3'd9};
    //LDI R4, 6
    C1.P1.instmem[1] <= {7'b1001100, 3'd4, 3'd0, 3'd6};
    //ST R3, R4
    C1.P1.instmem[2] <= {7'b0100000, 3'd0, 3'd3, 3'd4};

    //Asked instruction
    //LD R2, R3
    C1.P1.instmem[3] <= {7'b0010000, 3'd2, 3'd3, 3'd0};
    //ADI R2, R2, 1
    C1.P1.instmem[4] <= {7'b1000010, 3'd2, 3'd2, 3'd1};
    //ADD R3, R2, R3
    C1.P1.instmem[5] <= {7'b0000010, 3'd3, 3'd2, 3'd3};
end

initial begin
    RESET = 1;
    #PERIOD RESET = 0;
end

initial #50 $finish;

endmodule