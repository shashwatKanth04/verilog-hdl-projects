`timescale 1ns / 1ps

module tb_baicgates;
    reg a, b;
    wire andg, org, exor, exnor, nandg, notg, norg;
    integer file, output_file, status;


    basicgates_verilog dut (
        .a(a), .b(b), .andg(andg), .org(org), .exor(exor), 
        .exnor(exnor), .nandg(nandg), .notg(notg), .norg(norg)
    );

    initial begin
        file = $fopen("E:/test_vectors.txt", "r");
        output_file = $fopen("E:/results.txt", "w");

        if (file == 0 || output_file == 0) begin
            $display("Error: Could not open file(s). check path.");
            $finish;
        end

        $fdisplay(output_file, "Time | a b | AND OR XOR");
        $fdisplay(output_file, "-----------------------");

        while (!$feof(file)) begin
            // Changed input_file to file to match your declaration
            status = $fscanf(file, "%b %b\n", a, b);     
            
            if (status == 2) begin
                #10; // Wait for gates to process
                // Write to file
                $fdisplay(output_file, "%4d | %b %b |  %b   %b   %b", $time, a, b, andg, org, exor);
                // Print to console
                $display("Time=%0t | a=%b b=%b => AND=%b", $time, a, b, andg);
            end
        end

        // 3. Cleanup
        $fclose(file);
        $fclose(output_file);
        #10;
        $finish;
    end
endmodule
