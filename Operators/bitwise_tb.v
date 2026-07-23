module bitwise_tb;
reg [3:0]a;
reg [3:0]b;
reg [1:0]sel;
wire [7:0]y;
bitwise bbt (.a(a),.b(b),.sel(sel),.y(y));
initial begin
a=4'b1010;b=4'b1100;
sel=2'b00;#10;
sel=2'b01;#10;
sel=2'b10;#10;
sel=2'b11;#10;
end
initial begin
$monitor("Time=%0t, a=%b b=%b sel=%b y=%b",$time,a,b,sel,y);
#50;
$finish;
end
endmodule

