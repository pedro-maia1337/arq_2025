// -------------------------
// Guia_0704 - GATES
// Nome: Pedro Henrique Cardoso Maia
// Matricula: 874398
// -------------------------
// -------------------------
// f7_gate
// --------------------------
module lu_or_nor_xor_xnor ( output s_selected,
    input  a,
    input  b,
    input  sel1,
    input  sel0 );
// definir dados locais
    wire or_result;
    wire nor_result;
    wire xor_result;
    wire xnor_result;
    
// descrever por portas
    or OR1 ( or_result, a, b );
    nor NOR1 ( nor_result, a, b );
    xor XOR1 ( xor_result, a, b );
    xnor XNOR1 ( xnor_result, a, b );
    
    // Multiplexer 4x1
    wire not_sel1, not_sel0;
    wire and_or, and_nor, and_xor, and_xnor;
    
    not NOT1 ( not_sel1, sel1 );
    not NOT2 ( not_sel0, sel0 );
    
    and AND1 ( and_or, or_result, not_sel1, not_sel0 );
    and AND2 ( and_nor, nor_result, not_sel1, sel0 );
    and AND3 ( and_xor, xor_result, sel1, not_sel0 );
    and AND4 ( and_xnor, xnor_result, sel1, sel0 );
    
    or OR_FINAL ( s_selected, and_or, and_nor, and_xor, and_xnor );
    
endmodule // lu_or_nor_xor_xnor
// -------------------------
// test_lu
// -------------------------
module test_lu;
// ------------------------- definir dados
    reg a;
    reg b;
    reg sel1;
    reg sel0;
    wire s_selected;
    lu_or_nor_xor_xnor LU1 ( .s_selected(s_selected), .a(a), .b(b), .sel1(sel1), .sel0(sel0) );
    
// ------------------------- parte principal
    initial
      begin : main
        $display("Guia_0704 - Pedro Henrique Cardoso Maia - 874398");
        $display(" a | b | sel | s_selected");
        
        for (integer i = 0; i < 16; i = i + 1) begin
            {a, b, sel1, sel0} = i[3:0]; 
            #1;
            $monitor("%2b | %2b | %1b%1b | %10b", a, b, sel1, sel0, s_selected);
        end
      end
endmodule // test_lu