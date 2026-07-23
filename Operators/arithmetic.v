module arithmetic(input [3:0]a,b,input [2:0] sel,output reg [7:0]y);

always @(*) begin
case(sel)
3'b000:y=a+b;
3'b001:y=a-b;
3'b010:y=a*b;
3'b011:begin
if(b==0)
y=8'bxxxxxxx;
else
y=a/b;
end
3'b100:begin
if (b==0)
y=8'bxxxxxxxx;
else
y=a%b;
end
3'b101:y=a*a;
default:y=8'bxxxxxxx;
endcase
end
endmodule


