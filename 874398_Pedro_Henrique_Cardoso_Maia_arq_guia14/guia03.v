/*
    Pedro Henrique Cardoso Maia - 874398
    Guia14_03
*/

module ring_shift (
    input clk,
    input clear,   // ativo em nível baixo
    input ld,      // carga unitária no primeiro estágio
    output reg [5:0] q
);
    always @(posedge clk or negedge clear) begin
        if (!clear)
            q <= 6'b000000;              // reset global
        else if (ld)
            q <= 6'b000001;              // carga unitária (bit 0 = 1)
        else
            q <= {q[0], q[5:1]};         // deslocamento circular à direita
    end
endmodule

`timescale 1ns/1ps

module ring_shifttb;
    reg clk;
    reg clear;
    reg ld;
    wire [5:0] q;

    //teste
    ring_shift_right_6bits DUT (
        .clk(clk),
        .clear(clear),
        .ld(ld),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Tempo | CLR | LD | Q[5:0]");
        $display("--------------------------------------------------");
        $monitor("%4dns |  %b  | %b  | %b", $time, clear, ld, q);
        clk = 0; clear = 0; ld = 0;
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
        $display("--------------------------------------------------");
        $finish;
    end
endmodule