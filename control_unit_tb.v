`timescale 1ns / 100ps

module control_unit_tb;

reg[5:0] opCode;
wire RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,Jump;
wire[1:0] ALUOp;

control_unit CU(RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,Jump,ALUOp,opCode);

initial begin
//Need to verify all 9 control signals for each opcode

//R-type
opCode = 6'b000000;

#100 //lw
opCode = 6'b100011;

#100 //sw
opCode = 6'b101011;

#100 //beq
opCode = 6'b000100;

#100 //addi
opCode = 6'b001000;

#100 //j
opCode = 6'b000010;

#100 //unrecognized opCode
//should all be Z
opCode = 6'b110110;

end
endmodule



