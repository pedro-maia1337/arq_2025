/*
    Guia_0202.v
    874398 - Pedro Henrique Cardoso Maia
*/

module Guia_0202;
// define data
    real x = 0.875; // decimal
    integer y = 7 ; // counter
    reg [7:0] b = 0 ; // binary
    // actions
    initial
        begin : main
            $display ( "Guia_0202" );
            $display ( "x = %f" , x );
            while ( x > 0 && y >= 0 )
                begin
                if ( x*2 >= 1 )
                begin
                    b[y] = 1;
                    x = x*2.0 - 1.0;
                end
                else
                begin
                    b[y] = 0;
                    x = x*2.0;
                end // end if
                y=y-1;
            end // end while
            $display ( "b = 0.%8b", b );
    end // main
endmodule // Guia_0202