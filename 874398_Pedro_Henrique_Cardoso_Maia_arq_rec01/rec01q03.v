// -------------------------
// Recuperação 01 - Questão 03
// Nome: Pedro Henrique Cardoso Maia
// Matricula: 874398
// -------------------------
// -------------------------

module f ( output S,
    input A,
    input B,
    input C );

    assign S = (~A | C) & (A | B) & (B | C);
endmodule // f

module test_f;
    reg A;
    reg B;
    reg C;
    wire S;

    f moduloA (S, A, B, C);

    initial
     begin : main
        $display("A B C | S");
        A=0; B=0; C=0; #1 $display("%b %b %b | %b", A, B, C, S);
        A=0; B=0; C=1; #1 $display("%b %b %b | %b", A, B, C, S);
        A=0; B=1; C=0; #1 $display("%b %b %b | %b", A, B, C, S);
        A=0; B=1; C=1; #1 $display("%b %b %b | %b", A, B, C, S);
        A=1; B=0; C=0; #1 $display("%b %b %b | %b", A, B, C, S);
        A=1; B=0; C=1; #1 $display("%b %b %b | %b", A, B, C, S);
        A=1; B=1; C=0; #1 $display("%b %b %b | %b", A, B, C, S);
        A=1; B=1; C=1; #1 $display("%b %b %b | %b", A, B, C, S);
        $finish;
    end
endmodule // test_f5