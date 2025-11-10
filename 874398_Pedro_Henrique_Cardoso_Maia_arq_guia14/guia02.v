/*
    Pedro Henrique Cardoso Maia - 874398
    Guia14_02
*/

module left (
    input clk,
    input clear,
    input ld,
    output reg [5:0] q
);
    always @(posedge clk or negedge clear) begin
        if (!clear)
            q <= 6'b000000;      
        else if (ld)
            q <= 6'b111111;       
        else
            q <= {q[4:0], 1'b0};  // Deslocamento à esquerda
    end
endmodule

`timescale 1ns/1ps

module shift_left_6bits_preset_tb;
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

        //teste
    initial begin
        $display("Tempo | CLR | LD | Q[5:0]");
        $display("------------------------------------------------");
        $monitor("%4dns |  %b  | %b  | %b", $time, clear, ld, q);

        clk = 0;
        clear = 0;
        ld = 0;
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
