// -------------------------
// Recuperação 01 - Questão 02
// Nome: Pedro Henrique Cardoso Maia
// Matricula: 874398
// -------------------------
// -------------------------

module f ( output s, input a, input b, input c );
    wire w1, w2, w3, w4;
    not NOT_1 (w1,b);
    not NOT_2 (w2,c); //alteração para NOT_2 pois no material estava NOT_1 constando erro
    and AND_1 (w3,a,w2);
    and AND_2 (w4,a,w1,c);
    or OR__1 (s,w3,w4);
endmodule // s = f (a,b,c)

module test_f;
    reg a;
    reg b;
    reg c;
    wire s;
    f moduloA (s, a, b, c);

    initial 
     begin
        $display("a b c | s");

        a=0; b=0; c=0; #1 $display("%b %b %b | %b", a, b, c, s);
        a=0; b=0; c=1; #1 $display("%b %b %b | %b", a, b, c, s);
        a=0; b=1; c=0; #1 $display("%b %b %b | %b", a, b, c, s);
        a=0; b=1; c=1; #1 $display("%b %b %b | %b", a, b, c, s);
        a=1; b=0; c=0; #1 $display("%b %b %b | %b", a, b, c, s);
        a=1; b=0; c=1; #1 $display("%b %b %b | %b", a, b, c, s);
        a=1; b=1; c=0; #1 $display("%b %b %b | %b", a, b, c, s);
        a=1; b=1; c=1; #1 $display("%b %b %b | %b", a, b, c, s);

        $finish;
    end
endmodule // test_f5