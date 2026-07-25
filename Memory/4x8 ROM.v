module rom_4x8  (
    input wire [1:0] address,
    output reg [7:0] d_out
);

always @(*) begin
    case (address)
        2'b00: d_out = 8'hA5; // Data at address 0
        2'b01: d_out = 8'h3C; 
        2'b10: d_out = 8'hFF; 
        2'b11: d_out = 8'h10;
    default: d_out = 8'h00;
    endcase
end
endmodule

`timescale 1ns / 1ps

module tb_rom_4x8;

    reg [1:0] address;

    wire [7:0] d_out;


    rom_4x8 uut (
        .address(address), 
        .d_out(d_out)
    );

    initial begin

        address = 0;
        #10 address = 2'b00; $display("Addr: %b, Data: %h", address, d_out);
        #10 address = 2'b01; $display("Addr: %b, Data: %h", address, d_out);
        #10 address = 2'b10; $display("Addr: %b, Data: %h", address, d_out);
        #10 address = 2'b11; $display("Addr: %b, Data: %h", address, d_out);

        #10 $finish;
    end
      
endmodule
