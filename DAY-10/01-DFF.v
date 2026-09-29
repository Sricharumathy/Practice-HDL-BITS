module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );
    always @(posedge clk)
    begin
        if(d)
            q<=d;
        else
            q<=1'b0;        
    end
endmodule
