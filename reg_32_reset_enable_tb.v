`timescale 1 ns /100 ps

module reg_32_reset_enable_tb;
reg[31:0] in;
reg writeEnable;
reg reset;
reg clock;
wire[31:0] out;

reg_32_reset_enable register(out,in,clock,reset,writeEnable);

always #50 clock=~clock;

initial begin
//setup initial values, test write while enabled
in <= 32'haaaabbbb;
reset <= 0;
writeEnable <= 1;
clock <= 0;

//ensure new value not written
#200
writeEnable <= 0;
in <= 32'hbbbbcccc;

//test reset functionality - not on clock edge
#123
reset <= 1;
#77
reset <= 0;

//write back another value
#200
writeEnable <= 1;

//test reset on clock edge with write enable active
#200
reset <= 1;
end
endmodule
