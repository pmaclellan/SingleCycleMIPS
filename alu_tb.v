`timescale 1ns / 100ps

module alu_tb;

//inputs
reg[31:0] inputA, inputB;
reg[3:0] control;

//outputs
wire[31:0] aluResult;
wire zero;

//device under test
alu ALU(.inputA(inputA),
	.inputB(inputB),
	.control(control),
	.aluResult(aluResult),
	.zero(zero));

initial begin
#50 //test AND
//result should be 0x0000ffff
inputA <= 32'hff00ffff;
inputB <= 32'h00ffffff;
control <= 4'b0000;

#100 //test addition
//result should be oxaaaaaab0
inputA <= 32'haaaaaaaf;
inputB <= 32'h1;
control <= 4'b0010;

#100 //test subtraction, nonzero
//result should be 0xffff0000
inputA <= 32'hffffffff;
inputB <= 32'h0000ffff;
control <= 4'b0110;

#100 //test subtraction, zero
//result should be 0, zero flag set
inputB <= 32'hffffffff;

#100 //test set on less than, true
inputA <= 32'hcccccccc;
control <= 4'b0111;

#100 //test set on less than, false
inputB <= 32'haaaaaaaa;

#100 //test unrecognized control code
//aluResult should be Z
control <= 4'b1111;

end

endmodule

