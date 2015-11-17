module reg_32_reset_enable(out,in,clk,rst,en);
input[31:0] in;
input clk, rst, en;
output[31:0] out;
reg[31:0] out;

always@(posedge clk)
begin
if(en && ~rst) out <= in;
end

always@(posedge rst)
begin
out <= 0;
end

endmodule
