function [newI] = interpolacao_zero(I, fator)
    % Posições interpoladas com Nearest-neighbor Resampling
    % Cria um vetor IR para linhas e IC para colunas, do tamanho da nova imagem
    IR = [1:(size(I,1)*fator)];
    IC = [1:(size(I,2)*fator)];

    % As posições dos pixels da imagem original serão definidas calculando-se a
    % equivalência do pixel da nova imagem para o pixel da imagem original,
    % dividindo-se a posição do novo pixel pelo fator de escala.
    % Ex: o pixel posição 10 da nova imagem com fator 3/7 receberá o pixel ceil(10/(3/7)) = 24
    % Ex: o pixel posição 10 da nova imagem com fator 7/3 receberá o pixel ceil(10/(7/3)) = 5
    IR = ceil(IR./(fator));
    IC = ceil(IC./(fator));

    % Canal R da imagem original
    Red = I(:,:,1);
    % Interpolação em linha do canal R: nRed será um vetor com o tamanho da
    % nova imagem e vai receber as intensidades do canal vermelho original
    % respeitando a posição de interpolação dos pixels definida em IR
    nRed = Red(IR,:);
    % Interpolação em coluna do canal R: respeitando a posição de interpolação 
    % dos pixels definida em IC
    nRed = nRed(:,IC);

    % Canal G da imagem original
    Green = I(:,:,2);
    % Interpolação em linha do canal G
    nGreen = Green(IR,:);
    % Interpolação em coluna do canal G
    nGreen = nGreen(:,IC);

    % Canal B da imagem original
    Blue = I(:,:,3);
    % Interpolação em linha do canal B
    nBlue = Blue(IR,:);
    % Interpolação em coluna do canal B
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

