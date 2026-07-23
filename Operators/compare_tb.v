module compare_tb;
reg [7:0] a,b;
compare ct(.a(a),.b(b));
initial begin
	a=8'b01010101;
	b=8'b01010110;
	#30;
	a=8'b00011101;
	b=8'b00001110;
	#30;
end
initial  begin
	$monitor("Time=%0t  a=%b (a=%d) | b=%b (b=%d) ",$time,a,a,b,b);
	#100;
	$finish;
end
endmodule



