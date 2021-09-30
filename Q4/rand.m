I=imread('tigre.png');

I_q = floor(I./max(max(I)).*(2^3));
figure, imshow(uint8(I)), title('imagem original com 8 bits/pixel');
figure, imshow(uint8(I_q .* 40)), title('imagem requantizada em 3 bits/pixel');

[sx,sy] = size(I);
A= max(max(I))/5;
I_noise = rand(sx,sy) .* A;
I_qn = floor((I + I_noise)./max(max(I + I_noise)).*(2^3));
figure, imshow(uint8(I_qn .* 40)), title('imagem requantizada em 3 bits/pixel e ruído pseudo aleatorio');