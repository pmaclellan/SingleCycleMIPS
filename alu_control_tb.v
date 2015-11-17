`timescale 1ns / 100ps

module alu_control_tb;

//inputs
reg[1:0] aluOp;
reg[5:0] funcCode;

//output
wire[3:0] aluSignal;

//device under test
alu_control aluC(aluSignal,aluOp,funcCode);

initial begin
//verify output signal for each case

//lw/sw/addi
//output should be 0010
aluOp <= 2'b00;
funcCode <= 6'bx;


#100 //beq
//output should be 0110
aluOp <= 2'b01;

#100 //R-type default
//output should be Z
aluOp <= 2'b10;

#50 //R-type add
//output should be 0010
funcCode <= 6'b100000;

#100 //R-type sub
//output should be 0110
funcCode <= 6'b100010;

#100 //R-type AND
//output should be 0000
funcCode <= 6'b100100;

#100 //R-type set on less than
//output should be 0111
funcCode <= 6'b101010;

#100 //unrecognized aluOp
//output should be Z
aluOp <= 2'b11;

end

endmodule


