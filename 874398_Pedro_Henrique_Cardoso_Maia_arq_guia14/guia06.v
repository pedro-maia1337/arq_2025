/*
    Pedro Henrique Cardoso Maia - 874398
    Guia14_06
*/

module shift_left (
    input clk,
    input clr,         
    input ld,          
    input [4:0] din,   
    output reg [4:0] q 
);
    always @(posedge clk or negedge clr) begin
        if (!clr)
            q <= 5'b00000;                
        else if (ld)
            q <= din;                      
        else
            q <= {q[3:0], q[4]};           
    end
endmodule

`timescale 1ns/1ps

module shift_left_tb;
    reg clk;
    reg clr;
    reg ld;
    reg [4:0] din;
    wire [4:0] q;

    ring_shift_left_5bits DUT (
        .clk(clk),
        .clr(clr),
        .ld(ld),
        .din(din),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Tempo | CLR | LD | DIN   | Q[4:0]");
        $display("--------------------------------------------------");
        $monitor("%4dns |  %b  | %b  | %b | %b", $time, clr, ld, din, q);

        clk = 0; clr = 0; ld = 0; din = 5'b00000;
        #10;
        clr = 1;
        #10;
        din = 5'b10110;
        ld = 1;
        #10;
        ld = 0;
        #100;

        din = 5'b11001;
        ld = 1;
        #10;
        ld = 0;
        #100;

        $display("--------------------------------------------------");
        $finish;
    end
endmodule