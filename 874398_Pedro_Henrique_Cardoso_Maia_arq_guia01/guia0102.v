/* 
  Guia_0102.v
  874398 - Pedro Henrique Cardoso Maia
*/ 

`timescale 1ns/1ps

module guia_0102; 

    // define data 
    integer arquivo, n;
    reg [7:0] binario; 

    initial begin
        arquivo = $fopen("conv02.txt", "r");
        if (arquivo == 0) begin
            $display("Nao foi possivel abrir o arquivo.");
            $finish;
        end

        while (!$feof(arquivo)) begin
            n = $fscanf(arquivo, "%b\n", binario);
            if (n == 1) begin
                $display("%b (2) = %0d (10)", binario, binario);
            end
        end

        $fclose(arquivo);
        $finish;
    end // initial

endmodule // guia_0102
