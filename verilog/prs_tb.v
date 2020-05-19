module prsgen8_tb;

    parameter OUTPUT_VALUE=8'h80;

    reg reset = 0;
    reg clk = 0;
    wire out;

    /* Make a reset pulse and specify dump file */
    initial begin
        $dumpfile(`DUMP_FILE_NAME);
        $dumpvars(0, prsgen8_tb);

        # 0 reset = 1;
        # 2 reset = 0;
        # 1024 $finish;
    end

    /* Make a regular pulsing clock. */
    always #1 clk = !clk;

    prsgen8 prs(clk, reset, OUTPUT_VALUE, out);
endmodule
