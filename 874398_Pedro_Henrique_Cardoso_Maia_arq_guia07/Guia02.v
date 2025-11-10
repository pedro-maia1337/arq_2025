// -------------------------
// Guia_0702 - GATES
// Nome: Pedro Henrique Cardoso Maia
// Matricula: 874398
// -------------------------
// -------------------------
// f7_gate
// -------------------------
module f7 ( output s_selected,
    input  a,
    input  b,
    input  select );
// definir dados locais
    wire or_result;
    wire nor_result;

// descrever por portas
    or OR1 ( or_result, a, b );
    nor NOR1 ( nor_result, a, b );

    mux MUX1 ( .s(s_selected), .a(or_result), .b(nor_result), .select(select) );

endmodule // lu_or_nor
// -------------------------
// multiplexer
// -------------------------
module mux ( output s,
    input a,
    input b,
    input select );
// definir dados locais
    wire not_select;
    wire sa;
    wire sb;
// descrever por portas
    not NOT1 ( not_select, select );
    and AND1 ( sa, a, not_select );
    and AND2 ( sb, b, select );
    or OR1 ( s , sa, sb );
endmodule // mux
module test_f7;
// ------------------------- definir dados
    reg a;
    reg b;
    reg select;
    wire s_selected;
    f7 LU1 ( .s_selected(s_selected), .a(a), .b(b), .select(select) );
// ------------------------- parte principal
    initial
      begin : main
        $display("Guia_0702 - Pedro Henrique Cardoso Maia - 874398");
        $display(" a   b   sel     s_selected");
        $display("--------------------------");

        // projetar testes do modulo
        a = 1'b0; b = 1'b0; select = 1'b0; #1 $monitor("%2b  %2b  %3b  %10b", a, b, select, s_selected);
        a = 1'b0; b = 1'b1; select = 1'b0; #1 $monitor("%2b  %2b  %3b  %10b", a, b, select, s_selected);
        a = 1'b1; b = 1'b0; select = 1'b0; #1 $monitor("%2b  %2b  %3b  %10b", a, b, select, s_selected);
        a = 1'b1; b = 1'b1; select = 1'b0; #1 $monitor("%2b  %2b  %3b  %10b", a, b, select, s_selected);

        $display("--------------------------");

        a = 1'b0; b = 1'b0; select = 1'b1; #1 $monitor("%2b  %2b  %3b  %10b", a, b, select, s_selected);
        a = 1'b0; b = 1'b1; select = 1'b1; #1 $monitor("%2b  %2b  %3b  %10b", a, b, select, s_selected);
        a = 1'b1; b = 1'b0; select = 1'b1; #1 $monitor("%2b  %2b  %3b  %10b", a, b, select, s_selected);
        a = 1'b1; b = 1'b1; select = 1'b1; #1 $monitor("%2b  %2b  %3b  %10b", a, b, select, s_selected);
      end
endmodule // test_f7