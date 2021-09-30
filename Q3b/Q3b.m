I=imread('peppers.png');
imshow(I);

% Separa os canais de cores.
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

% Filtro gaussiano em cada canal separadamente.
R_gauss = gauss_filter(R);
G_gauss = gauss_filter(G);
B_gauss = gauss_filter(B);

% RGB_gaussian = zeros(size(I));
% RGB_gaussian = cat(3,R_gauss, G_gauss, B_gauss);
% figure,imshow(RGB_gaussian);

% Imagem original - Imagem blurred = apenas os detalhes( seccoes de borda).
R_det = R - R_gauss;
G_det = G - G_gauss;
B_det = B - B_gauss;

% RGB_gaussian = zeros(size(I));
% RGB_gaussian = cat(3,R_det, G_det, B_det);
% figure,imshow(RGB_gaussian);

% Detalhes adicionados a imagem original dando destaque a seccoes de borda.
R_highlighted = R + R_det;
G_highlighted = G + G_det;
B_highlighted = B + B_det;

% Inicializacao da matriz com o mesmo tamanho da matriz inicial.
RGB_gaussian = zeros(size(I));

% Remontagem da imagem colorida.
RGB_gaussian = cat(3,R_highlighted, G_highlighted, B_highlighted);
figure,imshow(RGB_gaussian);