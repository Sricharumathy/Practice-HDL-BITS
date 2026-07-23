module bitwise(input [3:0]a,b,input[1:0]sel,output reg [7:0]y);
always @(*) begin
case(sel)
2'b00:y=a&b;
2'b01:y=a|b;
2'b10:y=a^b;
2'b11:y={4'b0000,~b};
default:y=8'bxxxxxxxx;
endcase
end endmodule

