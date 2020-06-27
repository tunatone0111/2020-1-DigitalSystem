module memory(Din, Adrin, Dout, MW);

input [15:0] Din, Adrin;
input MW;
output reg [15:0] Dout;

reg [15:0] mem[0:7];

always @(Din or Adrin) begin
    if(MW == 1'b1) mem[Adrin] <= Din;
    else Dout <= mem[Adrin];
end

endmodule