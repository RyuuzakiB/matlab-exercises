function imggn = gaussianNoise(img)

dp = 25; % Desvio padrão de 20

imggn = double(img) + dp.*randn(size(img)); % Aplicação do ruído com uma distribuição normal
imggn = J./255;

end
