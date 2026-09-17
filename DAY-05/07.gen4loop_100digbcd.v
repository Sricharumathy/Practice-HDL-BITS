module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [99:0] c;
    genvar i;

    generate
        for(i = 0; i < 100; i = i + 1) begin : bcd_add
            if(i == 0)
                bcd_fadd fa(
                    .a(a[3:0]),
                    .b(b[3:0]),
                    .cin(cin),
                    .cout(c[0]),
                    .sum(sum[3:0])
                );
            else
                bcd_fadd fa(
                    .a(a[i*4+3:i*4]),
                    .b(b[i*4+3:i*4]),
                    .cin(c[i-1]),
                    .cout(c[i]),
                    .sum(sum[i*4+3:i*4])
                );
        end
    endgenerate

    assign cout = c[99];
            
                
    

endmodule

