module mod10(input clk, rst, output reg[3:0]y);
always@(posedge clk)
if(rst || y==4'd9) begin
    y<=4'b0000;
end

else begin
    y<=y+1'b1;
end
endmodule

module mod10_tb();

    reg t_clk;
    reg t_rst;
    wire [3:0] t_y;


    mod10 uut (
        .clk(t_clk),
        .rst(t_rst),
        .y(t_y)
    );
    always #5 t_clk = ~t_clk;

    initial begin
        // Initialize signals
        t_clk = 0;
        t_rst = 1;
        
        #12 t_rst = 0;

        #150;

        t_rst = 1;
        #10 t_rst = 0;

        #150 $finish;
    end

    initial begin
        $monitor("Time: %0t | Reset: %b | Count: %d", $time, t_rst, t_y);
    end

endmodule

