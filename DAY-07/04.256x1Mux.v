module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    assign out=sel?in[sel]:in[sel];

endmodule

