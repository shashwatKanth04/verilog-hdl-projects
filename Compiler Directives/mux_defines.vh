`define DATA_WIDTH 8
`define MUX_4_1
`ifdef MUX_2_1
    `define MUX_WIDTH 2
`elsif MUX_4_1
    `define MUX_WIDTH 4
`elsif MUX_8_1
    `define MUX_WIDTH 8
`endif
