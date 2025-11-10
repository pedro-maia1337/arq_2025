// -------------------------
// Guia_0703 - GATES
// Nome: Pedro Henrique Cardoso Maia
// Matricula: 874398
// -------------------------
// -------------------------
// f7_gate
// -------------------------
module f7_full ( output s_selected,
    input  a,
    input  b,
    input  select_group,
    input  select_operation );
// definir dados locais
    wire and_nand_result;
    wire or_nor_result;

// descrever por portas
    f7_and_nand AND_NAND_GROUP (
        .s_selected (and_nand_result),
        .a          (a),
        .b          (b),
        .select     (select_operation)
    );

    f7_or_nor OR_NOR_GROUP (
        .s_selected (or_nor_result),
        .a          (a),
        .b          (b),
        .select     (select_operation)
    );

    mux MUX_GROUP_SELECT (
        .s      (s_selected),
        .a      (and_nand_result),
        .b      (or_nor_result),
        .select (select_group)
    );

endmodule // f7_full
// -------------------------
// lu_and_nand
// -------------------------
module f7_and_nand ( output s_selected,
    input  a,
    input  b,
    input  select );
// definir dados locais
    wire and_result;
    wire nand_result;

// descrever por portas
    and AND1 ( and_result, a, b );
    nand NAND1 ( nand_result, a, b );

    // Multiplexer para selecionar a saída dentro do grupo AND/NAND
    mux MUX_OP_SELECT ( .s(s_selected), .a(and_result), .b(nand_result), .select(select) );

endmodule // lu_and_nand
// -------------------------
// f7_or_nor
// -------------------------
module f7_or_nor ( output s_selected,
    input  a,
    input  b,
    input  select );
// definir dados locais
    wire or_result;
    wire nor_result;

// descrever por portas
    or OR1 ( or_result, a, b );
    nor NOR1 ( nor_result, a, b );

    // Multiplexer para selecionar a saída dentro do grupo OR/NOR
    mux MUX_OP_SELECT ( .s(s_selected), .a(or_result), .b(nor_result), .select(select) );

endmodule // f7_or_nor
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
module test_f7_full;
// ------------------------- definir dados
    reg a;
    reg b;
    reg select_group;
    reg select_operation;
    wire s_selected;
    f7_full LU1 ( .s_selected(s_selected), .a(a), .b(b), .select_group(select_group), .select_operation(select_operation) );
// ------------------------- parte principal
    initial
      begin : main
        $display("Guia_0703 - Pedro Henrique Cardoso Maia - 874398");
        $display("Test LU's module");
        $display(" a   b   sel   s_and   s_nand  s_selected");

        for (integer i = 0; i < 16; i = i + 1) begin
            {a, b, select_group, select_operation} = i[3:0]; 
            #1;
            $monitor("%2b | %2b | %7b | %6b | %10b", a, b, select_group, select_operation, s_selected);
        end
      end
endmodule // test_f7_full