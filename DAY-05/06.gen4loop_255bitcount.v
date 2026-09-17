module top_module(
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum
);

genvar i;

generate
    for(i = 0; i < 100; i = i + 1) begin : fa_loop
        if(i == 0)
            fulladder fa(a[i], b[i], cin, sum[i], cout[i]);
        else
            fulladder fa(a[i], b[i], cout[i-1], sum[i], cout[i]);
    end
endgenerate

endmodule


module fulladder(
    input a, b, cin,
    output sum, cout
);

assign sum  = a ^ b ^ cin;
assign cout = (a & b) | (a & cin) | (b & cin);

endmodule
