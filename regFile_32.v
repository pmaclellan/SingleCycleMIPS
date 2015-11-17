module regFile_32(readRegA,readRegB,readSelA,readSelB,
		writeEnable,writeData,writeSel,
		clock);

reg[31:0] regFile[0:31];

output[31:0] readRegA, readRegB;
reg[31:0] readRegA, readRegB;

input[31:0] writeData;
input[4:0] writeSel, readSelA, readSelB;
input writeEnable, clock;

//define synchronous, enabled write behavior
always@(posedge clock)
begin
if (writeEnable) regFile[writeSel] <= writeData;
end

//define constant read behavior
always@(*)
begin
readRegA = regFile[readSelA];
readRegB = regFile[readSelB];
end

endmodule

