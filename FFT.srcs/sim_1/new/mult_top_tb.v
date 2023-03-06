module mult_top_tb();

    // Inputs
    reg clk;
    reg rst_n;
    reg en;
    reg[7:0] mult_1;
    reg[7:0] mult_2;

    // Outputs
    wire[15:0] result;

    // Instantiate the DUT
    mult_top dut (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .mult_1(mult_1),
        .mult_2(mult_2),
        .result(result)
    );

    // Test bench code goes here
    initial begin
        // Initialize input values
        clk = 0;
        rst_n = 0;
        en = 0;
        mult_1 = 0;
        mult_2 = 0;

        // Wait for the reset to be released
        #10 rst_n = 1;
        #10 en = 1;

        // Set some input values and check the results
        mult_1 = -8;
        mult_2 = 4;
        #10;
        $display("Multiplying 3 and 4, result is %d", result);

        mult_1 = 5;
        mult_2 = 6;
        #10;
        $display("Multiplying 5 and 6, result is %d", result);

        mult_1 = 7;
        mult_2 = 8;
        #10;
        $display("Multiplying 7 and 8, result is %d", result);
		#80;
        // Finish the simulation
        $finish;
    end

    // Clock generator
    always #5 clk = ~clk;

endmodule
