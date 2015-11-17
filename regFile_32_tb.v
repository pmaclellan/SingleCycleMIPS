`timescale 1ns/100ps

module regFile_32_tb;

//inputs
reg[31:0] writeData;
reg writeEnable, clock;
reg[4:0] writeSel, readSelA, readSelB;

//outputs
wire[31:0] readRegA, readRegB;

regFile_32 regFile(.writeEnable(writeEnable),
		   .clock(clock),
		   .writeData(writeData),
		   .writeSel(writeSel),
		   .readSelA(readSelA),
	  	   .readSelB(readSelB),
		   .readRegA(readRegA),
		   .readRegB(readRegB));


always #50 clock = ~clock;

initial begin
clock <= 0;
//write value into register at first clock cycle
//writeData should appear on readRegA immediately
writeData <= 32'haaaaaaaa;
writeSel <= 5'd12;
readSelA <= 5'd12;
readSelB <= 5'd13;
writeEnable <= 1;

#75 //make sure write enable low prevents writing
//readRegB should still be XXXXXXXX
writeEnable <= 0;
writeSel <= 5'd13;

#70 //reenable writing and make sure readB works
writeData <= 32'hbbbbbbbb;
writeEnable <= 1;

#100 //test changing read selects asynchronously
//readRegA and readRegB should be XXXXXXXX
readSelA <= 5'd14;
readSelB <= 5'd15;
end

endmodule
