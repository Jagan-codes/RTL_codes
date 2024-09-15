
module i2c_master (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [6:0] addr,
    input wire [7:0] data,
    inout wire i2c_sda,
    inout wire i2c_scl,
    output reg arbitration_lost
);

    localparam IDLE = 3'd0,
               START = 3'd1,
               ADDR = 3'd2,
               DATA = 3'd3,
               ACK = 3'd4,
               STOP = 3'd5,
               ARBITRATION = 3'd6;

    reg [2:0] state;
    reg [3:0] bit_cnt;
    reg [7:0] shift_reg;

    reg sda_out;
    wire sda_in;
    assign sda_in = i2c_sda;
    assign i2c_sda = sda_out ? 1'b0 : 1'bz;
    assign i2c_scl = (state == IDLE || state == STOP) ? 1'b1 : clk;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            bit_cnt <= 4'd0;
            shift_reg <= 8'd0;
            sda_out <= 1'b1;
            arbitration_lost <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        state <= START;
                        sda_out <= 1'b0; 
                    end
                end
                START: begin
                    state <= ADDR;
                    bit_cnt <= 7;
                    shift_reg <= {addr, 1'b0};
                end
                ADDR: begin
                    if (bit_cnt == 0) begin
                        state <= ACK;
                    end else begin
                        sda_out <= shift_reg[bit_cnt];
                        bit_cnt <= bit_cnt - 1;
                    end
                end
                ACK: begin
                    sda_out <= 1'b1; 
                    state <= DATA;
                    bit_cnt <= 8;
                    shift_reg <= data;
                end
                DATA: begin
                    if (bit_cnt == 0) begin
                        state <= ACK;
                    end else begin
                        sda_out <= shift_reg[bit_cnt - 1];
                        bit_cnt <= bit_cnt - 1;
                    end
                end
                STOP: begin
                    sda_out <= 1'b0;
                    state <= IDLE;
                end
                ARBITRATION: begin
                    if (sda_in != sda_out) begin
                        arbitration_lost <= 1'b1;
                        state <= STOP;
                    end
                end
                default: state <= IDLE;
            endcase

            if ((state == ADDR || state == DATA) && sda_in != sda_out) begin
                state <= ARBITRATION;
            end
        end
    end
endmodule
