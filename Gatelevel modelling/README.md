# Verilog HDL Projects

Verilog HDL implementations built during the PGCP-VLSI program at CDAC-ACTS, Pune.

## Combinational Circuits (Gate-Level Modeling)

| Design | File | Description |
|---|---|---|
| Half Adder | halfa_gate.v | 1-bit addition without carry-in |
| Full Adder | full_add_gate.v | 1-bit addition with carry-in/out |
| Ripple Carry Adder (RCA) | rca.v | Multi-bit adder built from Full Adders |
| 4:1 MUX | mux41.v | 4-to-1 Multiplexer |
| 1:4 DEMUX | demux14.v | 1-to-4 Demultiplexer |
| Tri-State Buffer | buffif0_1.v | Tri-state buffer using bufif primitive |

**Modeling style:** Gate-level (built-in primitives)
**Tools used:** QuestaSim, Xilinx ISE/Vivado, Quartus II
**Status:** Testbenches to be added.
