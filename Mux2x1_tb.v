`timescale 1 ns / 100 ps
module Mux2x1_tb;
reg a, b, sel;
wire out;

Mux2x1 mux(out, a, b, sel);

initial begin
	sel=0;
	a=1;
	b=0;
	#100 sel=1;
	#50 a=0;
	    b=1;
	#50 sel=0;
	//#250 $finish;
end
endmodule
