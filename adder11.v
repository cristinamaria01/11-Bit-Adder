module half_adder(
    output sum,
    output c_out,   // carry out
    input a,
    input b);

xor(sum, a, b);
and(c_out, a, b);

endmodule


module full_adder(
    output sum,
    output c_out,   // carry out
    input a,
    input b,
    input c_in);    // carry in

wire sum_ab;        //  a ^  b
wire c_ab;          //  a && b
wire x;             // (a ^  b) && c_in

half_adder h1(sum_ab, c_ab, a, b);
half_adder h2(sum, x, c_in, sum_ab);
or(c_out, x, c_ab);

endmodule

module adder4(
    output[3:0] sum,
    output c_out,       // carry out
    input[3:0] a, b,    // operands
    input c_in);        // carry in

full_adder a1(sum[0], c1,    a[0], b[0], c_in);
full_adder a2(sum[1], c2,    a[1], b[1], c1);
full_adder a3(sum[2], c3,    a[2], b[2], c2);
full_adder a4(sum[3], c_out, a[3], b[3], c3);

endmodule

module adder6(
		output[5:0] sum,
		output c_out,
		input[5:0] a,b,
		input c_in);

adder4     a1(sum[3:0],     c4, a[3:0], b[3:0], c_in);
full_adder a2(sum[4]  ,     c5, a[4],   b[4],     c4);
full_adder a3(sum[5]  ,  c_out, a[5],   b[5],     c5);

endmodule

module adder11(
    output[11:0] sum,
    input[10:0] a,
    input[10:0] b);

full_adder a_1(sum[0], c_out1, a[0], b[0], 1'b0);
adder4     a_2(sum[4:1], c_out2, a[4:1], b[4:1], c_out1);
adder6     a_3(sum[10:5], sum[11], a[10:5], b[10:5], c_out2);


endmodule 