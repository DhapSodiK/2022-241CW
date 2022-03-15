module task1_tb;

//Use these for the inputs.
logic a,b,c;

//Use these two signals for the outputs
logic [1:0] y_structural, y_other;

// Instantiate both UUT
task1a(y_structural, a, b, c);
task1b(y_other, a, b, c);

initial
begin
	//Write your testbench here

end

endmodule

