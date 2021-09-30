function I_out = hist_eq(I_in)
% HIST_EQ aplica o algoritmo de equalização de histograma
% a uma imagem 
%
% I_in -- uma imagem MxN uint8
%
% retorna uma imagem MxN uint8

[M, N]=size(I_in);

% calcula o histograma cumulativo
for i=1:256
    h(i)=sum(sum(I_in==i-1));
end;

I_out=I_in;
s=sum(h);

% Calcula e aplica a transformação
for i=1:256
    pos=find(I_in==i-1);
    I_out(pos)=sum(h(1:i))/s*255;
end;
figure, imshow(uint8(I_out));