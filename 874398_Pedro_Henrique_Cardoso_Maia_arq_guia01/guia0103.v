/* 
  Guia_0103.v
  874398 - Pedro Henrique Cardoso Maia
  Converte valores decimais fixos para base 4, 8 e 16
*/ 

`timescale 1ns/1ps

module guia_0103;

    integer a, b, c, d, e;

    initial begin
        a = 45;  
        b = 66; 
        c = 79; 
        d = 151;
        e = 781;

        $display("a.) Nao sei uma forma de converter para base 4 em verilog"); 
        $display("b.) %0d (10) = %0o (8)", b, b);
        $display("c.) %0d (10) = %0h (16)", c, c);
        $display("d.) %0d (10) = %0h (16)", d, d);
        $display("e.) %0d (10) = %0h (16)", e, e);

        $finish;
    end

endmodule
