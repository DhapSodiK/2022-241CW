// ELEC241 C1 2022
//Structural Version

/*
A	B	C	Y
0	0	0	00
0	0	1	01
0	1	0	01
0	1	1	10
1	0	0	01
1	0	1	10
1	1	0	10
1	1	1	11
*/

//inverse adder - same as TT
module task1a(output logic [1:0] Y, input logic A,B,C);

//Declare all inputs
wire notA,notB,notC,x1,x2,x3,x4,y1,y2,y3,y4;

//not gate delerations
not n1 (notA, A);
not n2 (notB, B);
not n3 (notC, C);

//1st set of outputs - Y[0] - in the format (xABC)
and output11 (x1,notA,notB,C);
and output12 (x2,notA,B,notC);
and output13 (x3,A,notB,notC);
and output14 (x4,A,B,C);

//2nd set of outputs - Y[1] - in format (yABC)
and output21 (y1,notA,B,C);
and output22 (y2,A,notB,C);
and output23 (y3,A,B,notC);
and output24 (y4,A,B,C);

//combinational logic (look into if its an or)
or other1 (Y[1],y1,y2,y3,y4);
or other2 (Y[0],x1,x2,x3,x4);

endmodule
