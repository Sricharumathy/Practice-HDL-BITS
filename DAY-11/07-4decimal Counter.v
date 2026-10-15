module top_module (
    input clk,
    input reset,
    output [3:1] ena,
    output [15:0] q
);

    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = (q[7:4] == 4'd9) && ena[1];
    assign ena[3] = (q[11:8] == 4'd9) && ena[2];

    always @(posedge clk) begin
        if (reset) begin
            q <= 16'h0000;
        end
        else begin
            // Ones
            if (q[3:0] == 4'd9)
                q[3:0] <= 4'd0;
            else
                q[3:0] <= q[3:0] + 1'b1;

            // Tens
            if (ena[1]) begin
                if (q[7:4] == 4'd9)
                    q[7:4] <= 4'd0;
                else
                    q[7:4] <= q[7:4] + 1'b1;
            end

            // Hundreds
            if (ena[2]) begin
                if (q[11:8] == 4'd9)
                    q[11:8] <= 4'd0;
                else
                    q[11:8] <= q[11:8] + 1'b1;
            end

            // Thousands
            if (ena[3]) begin
                if (q[15:12] == 4'd9)
                    q[15:12] <= 4'd0;
                else
                    q[15:12] <= q[15:12] + 1'b1;
            end
        end
    end

endmodule
