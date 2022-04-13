module task3_tb;

logic CLK, DATAIN;
logic [8:0] Q;
int counter = 0;
int fail = 0;
int lead = 0;

task3 u1 (Q,CLK, DATAIN);

task passed1;
	$display("Value has 1 leading High character");
	lead = 1;
endtask : passed1


task passed2;
	$display("vValue has 2 leading High characters");
	lead = 2;
endtask : passed2


task passed3;
	$display("Value has 3 leading High characters");
	lead = 3;
endtask : passed3


task passed4;
	$display("Value has 4 leading High characters");
	lead = 4;
endtask : passed4


task passed5;
	$display("Value has 5 leading High characters");
	lead = 5;
endtask : passed5

task passed6;
	$display("Value has 6 leading High characters");
	lead = 6;
endtask : passed6


task passed7;
	$display("Value has 7 leading High characters");
	lead = 7;
endtask : passed7


task passed8;
	$display("fValue has 8 leading High characters");
	lead = 8;
endtask : passed8


task failed;
	$display("failed");
	counter =1;
endtask : failed

//Write testbench here

	CLK = 0;
	repeat(131070)
	#1ps
	CLK = ~CLK;
	#1ps
	CLK = ~CLK;

end

	always@(posedge CLK) begin

		
		else if(counter==1)
			assert (Q==8'b1)
			passed1();
			else failed();

		else if(counter==2)
			assert (Q==8'b11)
			passed2();
			else failed();

		else if(counter==3)
			assert (Q==8'b111)
			passed3();
			else failed();

		else if(counter==4)
			assert (Q==8'b1111)
			passed4();
			else failed();

		else if(counter==5)
			assert (Q==8'b11111)
			passed5();
			else failed();

		else if(counter==6)
			assert (Q==8'b111111)
			passed6();
			else failed();

		else if(counter==7)
			assert (Q==8'b1111111)
			passed7();
			else failed();

		else if(counter==8)
			assert (Q==8'b11111111)
			passed8();
			else failed();

	counter++;
end

endmodule
