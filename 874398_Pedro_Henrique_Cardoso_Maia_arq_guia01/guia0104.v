/* 
  Guia_0103.v
  874398 - Pedro Henrique Cardoso Maia
*/ 

`timescale 1ns/1ps

module guia_0103;

    reg [7:0] a;  
    reg [7:0] b;
    reg [7:0] c;
    reg [7:0] d;
    reg [7:0] e;

    initial begin
        a = 8'b00010100;  
        b = 8'b00011001; 
        c = 8'b00100101;  
        d = 8'b00101001;  
        e = 8'b00100101;  

        $display("a) 10100(2) = %04h (4)", a);  
        $display("b) 11001(2) = %08h (8)", b);  
        $display("c) 100101(2) = %016h (16)", c);
        $display("d) 101001(2) = %08h (8):", d); 
        $display("e) 100101(2) = %04h (4)", e);  

        $finish;
    end

endmodule
