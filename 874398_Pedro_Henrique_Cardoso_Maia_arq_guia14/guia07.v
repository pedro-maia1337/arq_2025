/*
    Pedro Henrique Cardoso Maia - 874398
    Guia14_07
*/

module twisted (
    input wire clk,          
    input wire clr,         
    input wire load,        
    input wire [4:0] data_in, 
    output reg [4:0] q        
);
    always @(posedge clk or posedge clr) begin
        if (clr) begin
            q <= 5'b00000;
        end
        else if (load) begin
            q <= data_in;
        end
        else begin
            q <= { q[0], q[4:1] };  
            q[4] <= ~q[0];           
        end
    end
endmodule

`timescale 1ns/1ps

module twisted_tb;
    reg clk, clr, load;
    reg [4:0] data_in;
    wire [4:0] q;

    twisted_ring_right_5bit uut (
        .clk(clk),
        .clr(clr),
        .load(load),
        .data_in(data_in),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Tempo\tCLR\tLOAD\tDATA_IN\tQ");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, clr, load, data_in, q);
        clk = 0; clr = 1; load = 0; data_in = 5'b00000;
        #10 clr = 0;
        load = 1; data_in = 5'b00001;
        #10 load = 0;
        repeat (12) #10;
        $finish;
    end
endmodule