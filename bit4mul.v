
module andg(output y, input a, input b);
  assign y = a & b;
endmodule

module andg4(output [3:0] y, input [3:0] m, input q0);
  andg a0(y[0], m[0], q0);
  andg a1(y[1], m[1], q0);
  andg a2(y[2], m[2], q0);
  andg a3(y[3], m[3], q0);
endmodule

module fa(output sum, output carry, input a, input b, input cin);
  assign sum = a ^ b ^ cin;
  assign carry = ((a ^ b) & cin) | (a & b);
endmodule

module fa4(output [3:0] y, output cout, input [3:0] a, input [3:0] b, input cin);
  wire c1, c2, c3;
  fa f0(y[0], c1, a[0], b[0], cin);
  fa f1(y[1], c2, a[1], b[1], c1);
  fa f2(y[2], c3, a[2], b[2], c2);
  fa f3(y[3], cout, a[3], b[3], c3);
endmodule


module bit4mul(output [7:0] p, input [3:0] m, input [3:0] q);
  wire [31:0] w;
  assign w[4] = 1'b0;

  andg4 d1(w[3:0], m, q[0]);
  andg4 d2(w[8:5], m, q[1]);
  andg4 d3(w[12:9], m, q[2]);
  andg4 d4(w[16:13], m, q[3]);

  fa4 d5(w[20:17], w[21], {w[4], w[3:1]}, w[8:5], 1'b0); 
  fa4 d6(w[25:22], w[26], {w[21], w[20:18]}, w[12:9], 1'b0); 
  fa4 d7(w[30:27], w[31], {w[26], w[25:23]}, w[16:13], 1'b0); 
  assign p[0] = w[0];
  assign p[1] = w[17];
  assign p[2] = w[22];
  assign p[3] = w[27];
  assign p[4] = w[28];
  assign p[5] = w[29];
  assign p[6] = w[30];
  assign p[7] = w[31];
endmodule

module tb_bit4mul;
  reg [3:0] m; 
  reg [3:0] q;
  wire [7:0] p;
    integer input_file;
    integer output_file;
  bit4mul b1(.p(p), .m(m), .q(q));

  initial begin
  input_file=$fopen("C:/Users/pg-dvlsi/testing_again.txt", "r");
  while (!$feof(input_file))
  begin
  $fscanf(input_file, "%b %b\n", m,q);
  
    
    if (p !== 8'b11100001) begin
      $display("FAIL: Expected 225, Got %d (%b)", p, p);
    end else begin
      $display("SUCCESS: 15 * 15 = %d", p);
    end
    end
    $fclose(input_file);
    $finish;
    end
endmodule
