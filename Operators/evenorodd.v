module even_odd;
integer number,i;
initial begin
for(i=0;i<=10;i++)
number=$random;
begin
if(number%2==0)
begin 
$display("The given Number is EVEN");
end
else begin
$display("The given Number is ODD");
end
end
$finish;
end
endmodule

