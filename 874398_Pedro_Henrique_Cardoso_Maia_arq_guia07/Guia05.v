// -------------------------
// Guia_0705 - GATES
// Nome: Pedro Henrique Cardoso Maia
// Matricula: 874398
// -------------------------
// -------------------------
// f7_gate
// -------------------------
module lu_full_7_ops ( output s_selected,
    input  a,
    input  b,
    input  [2:0] sel );
// definir dados locais
    wire or_result;
    wire nor_result;
    wire and_result;
    wire nand_result;
    wire xor_result;
    wire xnor_result;
    wire not_result;
    
// descrever por portas 
    or    OR1    ( or_result, a, b );
    nor   NOR1   ( nor_result, a, b );
    and   AND1   ( and_result, a, b );
    nand  NAND1  ( nand_result, a, b );
    xor   XOR1   ( xor_result, a, b );
    xnor  XNOR1  ( xnor_result, a, b );
    not   NOT1   ( not_result, a );

    wire nsel2, nsel1, nsel0;
    wire i0, i1, i2, i3, i4, i5, i6, i7;
    
    not NOT_SEL2 ( nsel2, sel[2] );
    not NOT_SEL1 ( nsel1, sel[1] );
    not NOT_SEL0 ( nsel0, sel[0] );
    
    and MUX_AND_0 ( i0, or_result, nsel2, nsel1, nsel0 );
    and MUX_AND_1 ( i1, nor_result, nsel2, nsel1, sel[0] );
    and MUX_AND_2 ( i2, and_result, nsel2, sel[1], nsel0 );
    and MUX_AND_3 ( i3, nand_result, nsel2, sel[1], sel[0] );
    and MUX_AND_4 ( i4, xor_result, sel[2], nsel1, nsel0 );
    and MUX_AND_5 ( i5, xnor_result, sel[2], nsel1, sel[0] );
    and MUX_AND_6 ( i6, not_result, sel[2], sel[1], nsel0 );
    and MUX_AND_7 ( i7, 1'b0, sel[2], sel[1], sel[0] ); 
    or MUX_OR ( s_selected, i0, i1, i2, i3, i4, i5, i6, i7 );
    
endmodule // lu_full_7_ops
// -------------------------
// test_lu
// -------------------------
module test_lu;
// ------------------------- definir dados
    reg a;
    reg b;
    reg [2:0] sel;
    wire s_selected;
    lu_full_7_ops LU1 ( .s_selected(s_selected), .a(a), .b(b), .sel(sel) );
    
// ------------------------- parte principal
    initial
      begin : main
        $display("Guia_0705 - Pedro Henrique Cardoso Maia - 874398");
        $display(" a | b | sel | s_selected | (Operacao)");

        a = 1'b0; b = 1'b0; sel = 3'b000; #1 $monitor("%2b | %2b | %3b | %10b | (OR)", a, b, sel, s_selected);
        a = 1'b0; b = 1'b1; sel = 3'b000; #1 $monitor("%2b | %2b | %3b | %10b | (OR)", a, b, sel, s_selected);
        a = 1'b1; b = 1'b0; sel = 3'b000; #1 $monitor("%2b | %2b | %3b | %10b | (OR)", a, b, sel, s_selected);
        a = 1'b1; b = 1'b1; sel = 3'b000; #1 $monitor("%2b | %2b | %3b | %10b | (OR)", a, b, sel, s_selected);
        
      end
endmodule // test_lu