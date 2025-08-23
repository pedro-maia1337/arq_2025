/*
    Guia_0201.v
    874398 - Pedro Henrique Cardoso Maia
*/

module Guia_0201;
// define data
    real x = 0 ; // decimal
    real power2 = 1.0; // power of 2
    integer y = 7 ; // counter
    reg [7:0] b = 8'b00111000; // binary (only fraction part, Big Endian)
// actions
    initial
        begin : main
            $display ( "Guia_0201" );
            while ( y >= 0 )
                begin
                power2 = power2 / 2.0;
                if ( b[y] == 1 )
                begin
                    x = x + power2;
                end
                y=y-1;
            end // end while
            $display ( "x = %f", x );
    end // main
endmodule // Guia_0201