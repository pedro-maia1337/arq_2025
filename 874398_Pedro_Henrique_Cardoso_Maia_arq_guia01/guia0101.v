/* 
  Guia_0101.v 
  874398 - Pedro Henrique Cardoso Maia
*/ 

`timescale 1ns/1ps

module guia_0101; 

    // define data 
    integer arquivo, n, decimal;
 
    // ações
    initial begin
        arquivo = $fopen("conv01.txt", "r");
        if (arquivo == 0) begin
            $display("Nao foi possivel abrir o arquivo.");
            $finish;
        end

        while (!$feof(arquivo)) begin
            n = $fscanf(arquivo, "%d\n", decimal);
            if (n == 1) begin
                $display("%0d (10) = %b (2)", decimal, decimal);
            end
        end

        $fclose(arquivo);
        $finish;
    end // initial
 
endmodule // guia_0101
