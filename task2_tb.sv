module task2_tb;

// Add internal signals here

logic CLK, n_RESET; 	//inputs

logic [15:0] Q;		//outputs

parameter N = 16'b1010110011100001;
int counter = 0;

task2 o1 (Q,CLK, n_RESET);

task passed0;
	$display("initial passed");	//initial pass
endtask : passed0


task passed1;
	$display("value 1 passed");	//passes when prompt 1 is correct
endtask : passed1


task passed2;
	$display("value 2 passed");	//passes when prompt 2 is correct
endtask : passed2


task passed3;	
	$display("value 3 passed");	//passes when prompt 3 is correct
endtask : passed3


task passed4;
	$display("full loop passed");	//passes when value 65535 is the same as initial
endtask : passed4


task failed;
	$display("failed");		//fails when outputs are different
endtask : failed

initial begin

//Write testbench here

	n_RESET = 0;
	#1ps
	n_RESET = 1;
	
	CLK = 0;
	repeat(131070)	//2 clock cycles as 2ps period
	#1ps
	CLK = ~CLK;
	#1ps
	CLK = ~CLK;

end

	always@(posedge CLK) begin	//shifts character on clock edge
		if (counter==0)
		assert(Q==N) passed0();
			else failed();
		
		else if(counter==1)
			assert (Q==16'b1110001001110000)
			passed1();
			else failed();

		else if(counter==2)
			assert (Q==16'b0111000100111000)
			passed2();
			else failed();

		else if(counter==3)
			assert (Q==16'b0011100010011100)
			passed3();
			else failed();

		else if(counter==65535)
			assert (Q==N)
			passed4();
			else failed();

	counter = counter+1;
end

endmodule
