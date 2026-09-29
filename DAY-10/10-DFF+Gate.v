module top_module (
    input clk,
    input in, 
    output out);
    reg d;
    always @(posedge clk) begin
        d=out^in;
        out<=d;
    end
endmodule
