module traffic_light_controller (
    input clk,
    input reset,
    output reg red,
    output reg yellow,
    output reg green
);

    // State encoding (using `parameter` instead of SystemVerilog `enum`)
    parameter S0 = 2'b00; // RED
    parameter S1 = 2'b01; // GREEN
    parameter S2 = 2'b10; // YELLOW

    reg [1:0] state, next_state;
    integer count;

    // State register and counter
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            count <= 0;
        end else begin
            state <= next_state;
            if (count == 5)
                count <= 0;
            else
                count <= count + 1;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = (count == 5) ? S1 : S0;
            S1: next_state = (count == 5) ? S2 : S1;
            S2: next_state = (count == 5) ? S0 : S2;
            default: next_state = S0;
        endcase
    end

    // Output logic
    always @(*) begin
        red = 0;
        green = 0;
        yellow = 0;

        case (state)
            S0: red = 1;
            S1: green = 1;
            S2: yellow = 1;
        endcase
    end

endmodule
