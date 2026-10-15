// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A=0,B=1;

    reg present_state, next_state;

    always @(posedge clk) begin
        if ( reset ) begin  
            present_state<=B;
        end
        else begin
                present_state<=next_state;
        end
    end
       
        always @(*) begin
            case (present_state)
                A:begin
                    if(in)
                        next_state=A;
                    else
                        next_state=B;
                end
                B:begin
                    if(in)
                        next_state=B;
                    else
                        next_state=A;
                end
                
                default: next_state=B;
            endcase
        end

              
        always @(*)begin
            case (present_state)
                A: out<=0;
                B:out<=1;
                default:out<=0;
            endcase
        end
    

endmodule
