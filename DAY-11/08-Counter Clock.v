module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss);

    wire ss_roll = (ss == 8'h59);
    wire mm_roll = (mm == 8'h59);

    wire ena_mm = ena & ss_roll;
    wire ena_hh = ena & ss_roll & mm_roll;

    always @(posedge clk) begin
        if (reset) begin
            pm <= 1'b0;
            hh <= 8'h12;
            mm <= 8'h00;
            ss <= 8'h00;
        end
        else begin
            
            if (ena) begin
                if (ss[3:0] == 4'd9) begin
                    ss[3:0] <= 4'd0;
                    if (ss[7:4] == 4'd5)
                        ss[7:4] <= 4'd0;
                    else
                        ss[7:4] <= ss[7:4] + 4'd1;
                end
                else
                    ss[3:0] <= ss[3:0] + 4'd1;
            end

            
            if (ena_mm) begin
                if (mm[3:0] == 4'd9) begin
                    mm[3:0] <= 4'd0;
                    if (mm[7:4] == 4'd5)
                        mm[7:4] <= 4'd0;
                    else
                        mm[7:4] <= mm[7:4] + 4'd1;
                end
                else
                    mm[3:0] <= mm[3:0] + 4'd1;
            end

            if (ena_hh) begin
                if (hh == 8'h12)
                    hh <= 8'h01;
                else if (hh == 8'h09)
                    hh <= 8'h10;
                else if (hh == 8'h11) begin
                    hh <= 8'h12;
                    pm <= ~pm;
                end
                else
                    hh[3:0] <= hh[3:0] + 4'd1;
            end
        end
    end

endmodule
