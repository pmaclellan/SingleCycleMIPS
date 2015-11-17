module alu_control(aluSignal,aluOp,funcCode);

output[3:0] aluSignal;
reg[3:0] aluSignal;

input[1:0] aluOp;
input[5:0] funcCode;

always@(aluOp or funcCode)
begin

case(aluOp)
2'b10: case(funcCode)
	6'b100000: aluSignal=4'b0010; //add
	6'b100010: aluSignal=4'b0110; //sub
	6'b100100: aluSignal=4'b0000; //AND
	6'b101010: aluSignal=4'b0111; //set on less than
	default: aluSignal=4'bz;
	endcase
2'b00: aluSignal=4'b0010; //add for lw, sw, addi
2'b01: aluSignal=4'b0110; //sub for beq
default: aluSignal=4'bz;
endcase

end

endmodule
