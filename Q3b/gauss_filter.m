function [ Out_i ] = gauss_filter(I_in)

I = double(I_in);

% Coeficiente sigma e tamanho da janela de convolucao para cada lado do pixel em questao
% A area total utilizada para sampling de cada pixel sera tam*tam.
  s = 4.0;
  
  tam = 5;
  
% Tamanho da janela de convolucao M-1xN-1 
[x,y]=meshgrid(-tam:tam,-tam:tam);

% Tamanho da janela do escopo da execucao de filtro a cada pixel.
M =(size(x,1)-1);
N =(size(y,1)-1);

% Kernel do filtro gaussiano
Exp_comp = -(x.^2+y.^2)/(2*s*s);
Kernel= exp(Exp_comp)/(2*pi*s*s);
Kernel = Kernel / sum(Kernel(:)); % normalizacao dos valores

% Inicializacao da matriz de saida
Out_i=zeros(size(I));

% Adicao de zeros para evitar deformacao espacial nas bordas da imagem
I = padarray(I,[tam tam]);

% Operacao de convolucao pixel a pixel
for i = 1:size(I,1)-M  
    for j =1:size(I,2)-N
        temp = I(i:i+M,j:j+N).*Kernel; 
        Out_i (i,j)= sum(temp(:));
    end
end

Out_i  = uint8(Out_i);
% figure,imshow(Out_i);
end

