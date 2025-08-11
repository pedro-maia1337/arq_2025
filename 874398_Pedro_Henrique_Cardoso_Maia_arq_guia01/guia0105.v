/*
 Guia_0105.v
 874398 - Pedro Henrique Cardoso Maia
*/

module Guia_0105;

    reg [0:5][7:0] s_pucmg = {"P","U","C","-","M","G"};

    reg [0:15][7:0] s_2025_02;

    reg [0:8][7:0] s_belo_hz = {"B","e","l","o"," ","H","o","r","i"};

    reg [0:4][7:0] s_octal;

    reg [0:4][7:0] s_hex = {8'h4E,8'h6F,8'h69,8'h78,8'h65};

    integer i;

    initial begin : main
        s_2025_02[0] = "2"; s_2025_02[1] = "0"; s_2025_02[2] = "2"; s_2025_02[3] = "5"; 
        s_2025_02[4] = "-"; s_2025_02[5] = "0"; s_2025_02[6] = "2";
        for (i=7; i<16; i=i+1) s_2025_02[i] = 8'h00;

        s_octal[0] = 8'd84;  
        s_octal[1] = 8'd97;  
        s_octal[2] = 8'd114; 
        s_octal[3] = 8'd100;  
        s_octal[4] = 8'd101;  

        for (i=0; i<6; i=i+1) $write("%c", s_pucmg[i]);
        $write("\n(16): ");
        for (i=0; i<6; i=i+1) $write("%h ", s_pucmg[i]);
        $write("\n");

        for (i=0; i<7; i=i+1) $write("%c", s_2025_02[i]);
        $write("\n(16): ");
        for (i=0; i<7; i=i+1) $write("%h ", s_2025_02[i]);
        $write("\n");

        for (i=0; i<9; i=i+1) $write("%c", s_belo_hz[i]);
        $write("\n(2): ");
        for (i=0; i<9; i=i+1) $write("%08b ", s_belo_hz[i]);
        $write("\n");

        for (i=0; i<5; i=i+1) $write("%c", s_octal[i]);
        $write("\n(8): 124 141 162 144 145");
        $write("\n");

        for (i=0; i<5; i=i+1) $write("%c", s_hex[i]);
        $write("\n(16): ");
        for (i=0; i<5; i=i+1) $write("%h ", s_hex[i]);
        $write("\n");

        $finish;
    end

endmodule
