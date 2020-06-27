module computer(CLK, RESET)

input CLK, RESET;
wire MW;
wire [15:0] busD1, busAdr, busD2;

processor P1(CLK, RESET, busD1, busD2, busAdr, MW);
memory M1(busD2, busAdr, busD1, MW);

endmodule