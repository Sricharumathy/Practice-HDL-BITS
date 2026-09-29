module top_module (
    input clk,
    input x,
    output z
); 
 wire w1,w2,w3;
    reg q0,q1,q2;
    assign w1=q0^x;
    assign w2=~q1&x;
    assign w3=~q2|x;
    always @(posedge clk) begin
        q0<=w1;
        q1<=w2;
        q2<=w3;
    end
    assign z=~(q0|q1|q2);
    

endmodule
