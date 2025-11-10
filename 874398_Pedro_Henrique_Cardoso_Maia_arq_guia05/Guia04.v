// -------------------------
// Guia_0504.v - GATES
// Nome: Pedro Henrique Cardoso Maia
// Matricula: 874398
// -------------------------
// -------------------------

// f5_gate
// m a b s
// 0 0 0 1
// 1 0 1 1 
// 2 1 0 1
// 3 1 1 0 ~(a & b);
//
// -------------------------

module f5a ( output s,
    input a,
    input b );
// definir dado local
    wire not_s;
// descrever por portas
    and AND1(not_s, a, b );

    not NOT1(s, not_s);
    
endmodule // f5a

// -------------------------
// f5_gate
// m a b s
// 0 0 0 1
// 1 0 1 1 
// 2 1 0 1
// 3 1 1 0 ~(a & b);
//
// -------------------------
module f5b ( output s,
    input a,
    input b );
// descrever por expressao
    assign s = ~(a & b);
    endmodule // f5b

module test_f5;
// ------------------------- definir dados
    reg x;
    reg y;
    wire a, b;
    f5a moduloA ( a, x, y );
    f5b moduloB ( b, x, y );
// ------------------------- parte principal
    initial
     begin : main
        $display("Guia_0500 - Pedro Henrique Cardoso Maia - 873298");
        $display("Test module");
        $display("   x    y    a    b");
        // projetar testes do modulo
        $monitor("%4b %4b %4b %4b", x, y, a, b);
        x = 1'b0; y = 1'b0;
        #1 x = 1'b0; y = 1'b1;
        #1 x = 1'b1; y = 1'b0;
        #1 x = 1'b1; y = 1'b1;
    end
endmodule // test_f5