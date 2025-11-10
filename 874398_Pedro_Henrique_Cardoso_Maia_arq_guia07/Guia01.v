// -------------------------
// Guia_0701 - GATES
// Nome: Pedro Henrique Cardoso Maia
// Matricula: 874398
// -------------------------
// -------------------------
// f7_gate
// -------------------------
module f7 ( output s_and,
    output s_nand,
    output s_selected,
    input  a,
    input  b,
    input  select );
// definir dados locais
    wire and_result;
    wire nand_result;

// descrever por portas
    and AND1 ( and_result, a, b );
    nand NAND1 ( nand_result, a, b );

    mux MUX1 ( .s(s_selected), .a(and_result), .b(nand_result), .select(select) );

    assign s_and = and_result;
    assign s_nand = nand_result;

endmodule // f7
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
    wire s_and;
    wire s_nand;
    wire s_selected;
    f7 LU1 ( .s_and(s_and), .s_nand(s_nand), .s_selected(s_selected), .a(a), .b(b), .select(select) );
// ------------------------- parte principal
    initial
      begin : main
        $display("Guia_0701 - Pedro Henrique Cardoso Maia - 874398");
        $display(" a   b   sel   s_and   s_nand  s_selected");

        // projetar testes do modulo
        a = 1'b0; b = 1'b0; select = 1'b0; #1 $monitor("%2b  %2b  %3b  %5b  %6b  %10b", a, b, select, s_and, s_nand, s_selected);
        a = 1'b0; b = 1'b1; select = 1'b0; #1 $monitor("%2b  %2b  %3b  %5b  %6b  %10b", a, b, select, s_and, s_nand, s_selected);
        a = 1'b1; b = 1'b0; select = 1'b0; #1 $monitor("%2b  %2b  %3b  %5b  %6b  %10b", a, b, select, s_and, s_nand, s_selected);
        a = 1'b1; b = 1'b1; select = 1'b0; #1 $monitor("%2b  %2b  %3b  %5b  %6b  %10b", a, b, select, s_and, s_nand, s_selected);
      end
endmodule // test_f7