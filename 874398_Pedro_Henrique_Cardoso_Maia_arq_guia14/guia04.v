/*
    Pedro Henrique Cardoso Maia - 874398
    Guia14_04
*/

module twisted_left (
    input clk,
    input clear,   
    input ld,      
    output reg [5:0] q
);
    always @(posedge clk or negedge clear) begin
        if (!clear)
            q <= 6'b000000;                 
        else if (ld)
            q <= 6'b000001;                  
        else
            q <= {q[4:0], ~q[5]};           
    end
endmodule

`timescale 1ns/1ps

module twisted_ring_left_6bits_tb;
    reg clk;
    reg clear;
    reg ld;
    wire [5:0] q;

    twisted_ring_left_6bits DUT (
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
        #200;
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