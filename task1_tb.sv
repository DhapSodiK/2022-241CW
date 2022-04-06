module task1_tb;

//Use these for the inputs.
logic a,b,c;

//Use these two signals for the outputs
logic [1:0] y_structural, y_other;

//initiate the array
reg[2:0] mt;  

// Instantiate both UUT
task1a u1 (y_structural, a, b, c);
task1b u2 (y_other, a, b, c);

task passed;
	$display("passed");
endtask : passed

task failed;
	$display("failed");
endtask : failed

//take the array and replace with values from a, b and c
assign mt={a,b,c};

initial
begin
	//Write your testbench here
	mt = 3'b000;
	#50ps; assert(y_structural==y_other) passed(); else failed();

	mt = 3'b001;
	#50ps; assert(y_structural==y_other) passed(); else failed();

	mt = 3'b010;
	#50ps; assert(y_structural==y_other) passed(); else failed();

	mt = 3'b011;
	#50ps; assert(y_structural==y_other) passed(); else failed();

	mt = 3'b100;
	#50ps; assert(y_structural==y_other) passed(); else failed();

	mt = 3'b101;
	#50ps; assert(y_structural==y_other) passed(); else failed();

	mt = 3'b110;
	#50ps; assert(y_structural==y_other) passed(); else failed();

	mt = 3'b111;
	#50ps; assert(y_structural==y_other) passed(); else failed();

	$display ("Done");

end

endmodule

