module arithmetic_tb;
reg [3:0]a;
reg [3:0]b;
reg [2:0]sel;
wire [7:0]y;
arithmetic uut(.a(a),.b(b),.sel(sel),.y(y));
initial begin
a=4'b1100;b=4'b1010;
sel=3'b000;#10;
sel=3'b001;#10;
sel=3'b010;#10;
sel=3'b011;#10;
sel=3'b100;#10;
sel=3'b101;#10;
sel=3'b110;#10;
sel=3'b111;#10;
end
initial begin
$monitor("Time=%0t  ,a=%d ,b=%d ,sel=%d ,.y=%d",$time,a,b,sel,y);
#100;
$finish;
end
endmodule
