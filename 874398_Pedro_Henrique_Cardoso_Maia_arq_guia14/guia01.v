/*
    Pedro Henrique Cardoso Maia - 874398
    Guia14_01
*/

`timescale 1ns/1ps

module left_tb;

    reg clk;
    reg clear;
    reg ld;

    wire [5:0] q;

    left DUT (
        .clk(clk),
        .clear(clear),
        .ld(ld),
        .q(q)
    );

    always #5 clk = ~clk; 

    //Teste
    initial begin
        $display("Tempo   CLR  LD  Q[5:0]");
        $display("------------------------------------------------");
        $monitor("%4dns |  %b  | %b  | %b", $time, clear, ld, q);

        clk = 0;
        clear = 0; ld = 0;
        #10;

        clear = 1;
        #10;

        ld = 1;
        #10;
        ld = 0;

        #100;

        ld = 1;
        #10;
        ld = 0;

        #100;

        clear = 0;
        #10;
        clear = 1;

        #50;
        $display("------------------------------------------------");
        $finish;
    end

endmodule
