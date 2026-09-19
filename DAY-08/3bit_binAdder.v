module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    fadd d1(.a(a[0]),.b(b[0]),.cin(cin),.carry(cout[0]),.sum(sum[0]));
    fadd d2(.a(a[1]),.b(b[1]),.cin(cout[0]),.carry(cout[1]),.sum(sum[1]));
    fadd d3(.a(a[2]),.b(b[2]),.cin(cout[1]),.carry(cout[2]),.sum(sum[2]));
endmodule
module fadd(input a,b,cin,output carry,sum);
        assign sum=a^b^cin;
        assign carry=a&b|b&cin|cin&a;
        
endmodule

