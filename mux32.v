
module Mux2x1 (out, i0, i1, sel);
	output out;
	input i0, i1, sel;
	assign out = sel ? i1 : i0;
endmodule