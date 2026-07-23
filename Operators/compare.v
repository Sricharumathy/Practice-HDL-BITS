module compare(input [7:0]a,b);
always @(*) begin
if (a>=b)
$display("A is Bigger");
else if (a<=b)
$display("B is Bigger");
else
$display("Both are Equal");
end
endmodule
