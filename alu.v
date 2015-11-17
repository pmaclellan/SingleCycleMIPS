module alu(zero,aluResult,inputA,inputB,control);

input[31:0] inputA, inputB;
input[3:0] control;

output[31:0] aluResult;
reg[31:0] aluResult;
output zero;
reg zero;

always@(inputA or inputB or control)
begin
case(control)
4'b0000: aluResult = inputA & inputB; //AND
4'b0010: aluResult = inputA + inputB; //add
4'b0110: aluResult = inputA - inputB; //sub
4'b0111: aluResult = (inputA < inputB); //set on less than
default: aluResult = 32'bZ;
endcase
end

always@(*)
begin
zero = (aluResult == 32'b0);
end

endmodule

