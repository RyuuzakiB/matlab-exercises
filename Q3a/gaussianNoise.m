function imggn = gaussianNoise(img)

dp = 25; % Desvio padr�o de 20

imggn = double(img) + dp.*randn(size(img)); % Aplica��o do ru�do com uma distribui��o normal
imggn = J./255;

end
