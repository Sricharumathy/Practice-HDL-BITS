module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk) begin
        if(d)
            q<=d;
        else
            q<=1'b0;
    end
endmodule
