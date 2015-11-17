module control_unit(RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,Jump,ALUOp,opCode);

output RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,Jump;
reg RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,Jump;
output[1:0] ALUOp;
reg[1:0] ALUOp;

input[5:0] opCode;

always@(opCode)
begin
case(opCode)
//R-type
6'b000000: begin
	RegDst<=1;
	ALUSrc<=0;
	MemToReg<=0;
	RegWrite<=1;
	MemRead<=0;
	MemWrite<=0;
	Branch<=0;
	ALUOp<=2'b10;
	Jump<=0;
	end
//lw
6'b100011: begin
	RegDst<=0;
	ALUSrc<=1;
	MemToReg<=1;
	RegWrite<=1;
	MemRead<=1;
	MemWrite<=0;
	Branch<=0;
	ALUOp<=2'b00;
	Jump<=0;
	end
//sw
6'b101011: begin
	RegDst<=1'bx;
	ALUSrc<=1;
	MemToReg<=1'bx;
	RegWrite<=0;
	MemRead<=0;
	MemWrite<=1;
	Branch<=0;
	ALUOp<=2'b00;
	Jump<=0;
	end
//beq
6'b000100: begin
	RegDst<=1'bx;
	ALUSrc<=0;
	MemToReg<=1'bx;
	RegWrite<=0;
	MemRead<=0;
	MemWrite<=0;
	Branch<=1;
	ALUOp<=2'b01;
	Jump<=0;
	end
//addi
6'b001000: begin
	RegDst<=1;
	ALUSrc<=1;
	MemToReg<=0;
	RegWrite<=1;
	MemRead<=0;
	MemWrite<=0;
	Branch<=0;
	ALUOp<=2'b00;
	Jump<=0;
	end
//j
6'b000010: begin
	RegDst<=1'bx;
	ALUSrc<=1'bx;
	MemToReg<=1'bx;
	RegWrite<=0;
	MemRead<=0;
	MemWrite<=0;
	Branch<=0;
	ALUOp<=2'bx;
	Jump<=1;
	end

default: begin
	RegDst<=1'bz;
	ALUSrc<=1'bz;
	MemToReg<=1'bz;
	RegWrite<=1'bz;
	MemRead<=1'bz;
	MemWrite<=1'bz;
	Branch<=1'bz;
	ALUOp<=2'bz;
	Jump<=1'bz;
	end
endcase
end

endmodule

