I=imread('images/amsterdam.jpg');
figure, imshow(I);

% Scale com fator 7/3 utilizando interpolação de ordem zero
% (Nearest-neighbor Resampling)
newI1 = interpolacao_zero(I, 7/3);
% imwrite(newI1, 'images/amsterdam_f73.png');
figure, imshow(newI1);

% Scale com fator 3/7 utilizando interpolação de ordem zero
% (Nearest-neighbor Resampling)
newI2 = interpolacao_zero(I, 3/7);
% imwrite(newI2, 'images/amsterdam_f37.png');
figure, imshow(newI2);

% Scale com fator 2 utilizando interpolação bilinear
newI3 = interpolacao_bilinear_fator2(I);
% imwrite(newI3, 'images/amsterdam_f2.png');
figure, imshow(newI3);