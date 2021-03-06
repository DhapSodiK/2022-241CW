
module task2 #(parameter N=16'b1010110011100001) (output logic [15:0] Q, input logic CLK, n_RESET);

//Write solution here

logic [5:0] feedback;
always_comb begin

	feedback[5] = Q[0];		//bit 0 shifts to  16
	feedback[4] = Q[15];		//bit 16 shifts to 15
	feedback[3] = (Q[14] ^ Q[0]);	//bit 15 ^ 0 -> to bit 14
	feedback[2] = (Q[13] ^ Q[0]);	//bit 14 ^ 0 -> to bit 13
	feedback[1] = Q[12];		//bit 13 shifts to 12
	feedback[0] = (Q[11] ^ Q[0]);	//bit 12 ^ 0 -> to bit 11
end

	always_ff @(posedge CLK, negedge n_RESET)	begin	//trigger on a flip flop
		if(n_RESET == 1'b0)	begin			//starting reference point
			Q<=N;
	
	end
	else begin
		Q<={feedback[5:0], Q[10:1]};
	end
end
			

endmodule