function [newI] = interpolacao_bilinear_fator2(I)
    % Tamanho da imagem
    [nRows, nCols, nCh] = size(I);

    % Inicializa as imagens intermediárias
    nI1 = zeros(2*nRows, nCols);
    nI2 = zeros(2*nRows, 2*nCols);

    % Duplica as linhas pares e interpola as linhas ímpares da I gerando a nI1, 
    % em cada canal de cor
    for rgb = 1:nCh
        for i = 1:nRows-1
            for j = 1:nCols
                nI1(i*2,j,rgb) = I(i,j,rgb);
                nI1((i*2)+1,j,rgb) = (I(i,j,rgb) + I(i+1,j,rgb))/2;
            end;
        end;
    end;

    % Tamanho da imagem intermediária nI1
    [nRows, nCols, nCh] = size(nI1);

    % Duplica as colunas pares e interpola as colunas ímpares da nI1 gerando nI2
    % em cada canal de cor
    for rgb = 1:nCh
        for i = 1:nCols-1
            for j = 1:nRows-1
                nI2(j,i*2,rgb) = nI1(j,i,rgb);
                nI2(j,(i*2)+1,rgb) = (nI1(j,i,rgb) + nI1(j,i+1,rgb))/2;
            end;
        end;
    end;

    newI = uint8(nI2);
end

