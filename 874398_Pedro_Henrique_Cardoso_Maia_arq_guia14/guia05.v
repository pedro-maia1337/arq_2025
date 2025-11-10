/*
    Pedro Henrique Cardoso Maia - 874398
    Guia14_05
*/

module serial (
    input clk,
    input clr,           
    input ld,            
    input [5:0] din,     
    output reg serial_out,
    output reg [5:0] q   
);
    always @(posedge clk or negedge clr) begin
        if (!clr)
            q <= 6'b000000;                      
        else if (ld)
            q <= din;                            
        else
            q <= {q[4:0], 1'b0};              
    end
    
    always @(*) begin
        serial_out = q[5];
    end
endmodule

`timescale 1ns/1ps

module serial_tb;
    reg clk;
    reg clr;
    reg ld;
    reg [5:0] din;
    wire serial_out;
    wire [5:0] q;

    parallel_to_serial_6bits DUT (
        .clk(clk),
        .clr(clr),
        .ld(ld),
        .din(din),
        .serial_out(serial_out),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Tempo | CLR | LD | DIN    | Q       | Serial_out");
        $display("--------------------------------------------------");
        $monitor("%4dns |  %b  | %b  | %b | %b | %b", $time, clr, ld, din, q, serial_out);

        clk = 0; clr = 0; ld = 0; din = 6'b000000;
        #10;

        clr = 1;
        #10;

        din = 6'b101011;
        ld = 1;
        #10;
        ld = 0;
        #80;
        din = 6'b111000;
        ld = 1;
        #10;
        ld = 0;
        #60;

        $display("--------------------------------------------------");
        $finish;
    end
endmodule
