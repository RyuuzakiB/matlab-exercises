function [newI] = interpolacao_zero(I, fator)
    % Posi��es interpoladas com Nearest-neighbor Resampling
    % Cria um vetor IR para linhas e IC para colunas, do tamanho da nova imagem
    IR = [1:(size(I,1)*fator)];
    IC = [1:(size(I,2)*fator)];

    % As posi��es dos pixels da imagem original ser�o definidas calculando-se a
    % equival�ncia do pixel da nova imagem para o pixel da imagem original,
    % dividindo-se a posi��o do novo pixel pelo fator de escala.
    % Ex: o pixel posi��o 10 da nova imagem com fator 3/7 receber� o pixel ceil(10/(3/7)) = 24
    % Ex: o pixel posi��o 10 da nova imagem com fator 7/3 receber� o pixel ceil(10/(7/3)) = 5
    IR = ceil(IR./(fator));
    IC = ceil(IC./(fator));

    % Canal R da imagem original
    Red = I(:,:,1);
    % Interpola��o em linha do canal R: nRed ser� um vetor com o tamanho da
    % nova imagem e vai receber as intensidades do canal vermelho original
    % respeitando a posi��o de interpola��o dos pixels definida em IR
    nRed = Red(IR,:);
    % Interpola��o em coluna do canal R: respeitando a posi��o de interpola��o 
    % dos pixels definida em IC
    nRed = nRed(:,IC);

    % Canal G da imagem original
    Green = I(:,:,2);
    % Interpola��o em linha do canal G
    nGreen = Green(IR,:);
    % Interpola��o em coluna do canal G
    nGreen = nGreen(:,IC);

    % Canal B da imagem original
    Blue = I(:,:,3);
    % Interpola��o em linha do canal B
    nBlue = Blue(IR,:);
    % Interpola��o em coluna do canal B
    nBlue = nBlue(:,IC);

    % Nova imagem
    newI=zeros([size(IR,2), size(IC,2)]);
    % Popula os canais interpolados na nova imagem
    newI(:,:,1) = nRed;
    newI(:,:,2) = nGreen;
    newI(:,:,3) = nBlue;

    % Converte a imagem para uint8
    newI = uint8(newI);
end

