function atmfimg = alphatrimmedmean(noisedimg, window)

noisedimg = double(noisedimg(:,:,1))/255;

% Separamos os três canais RGB
redChannel = noisedimg(:,:,1);
greenChannel = noisedimg(:,:,2);
blueChannel = noisedimg(:,:,3);

RCorrigido = zeros(size(noisedimg));
GCorrigido = zeros(size(noisedimg));
BCorrigido = zeros(size(noisedimg));

% Criamos um canal vazio
blankChannel = zeros(size(noisedimg, 1), size(noisedimg, 2), 'uint8');

% Criamos as versões RGB da imagem
vermelho = cat(3, redChannel, blankChannel, blankChannel);
verde = cat(3, blankChannel, greenChannel, blankChannel);
azul = cat(3, blankChannel, blankChannel, blueChannel);


d1 = window;
d2 = window;
n = 5;

for r=1:size(noisedimg,1)
  for c=1:size(noisedimg,2)
  
      if r-n < 1 | n+r >= size(noisedimg,1) | c-n < 1 | c+n > size(noisedimg,2)
      RCorrigido(r,c) = vermelho(r,c);
      else
          fromrow=abs(r-n);
          torow=r+n;
          fromcol=abs(c-n);
          tocol=c+n;
          neig=vermelho(fromrow:torow,fromcol:tocol);
      localval=neig(:);
      s=sort(localval);
      somatorio=0;
      for i=d1+1:size(s,1)-d2
          somatorio=somatorio+s(i);
      end
      avg=(1/(n*n)-(d1+d2))*somatorio;
      RCorrigido(r,c)=avg;
      end
    end
  end
  
for r=1:size(noisedimg,1)
  for c=1:size(noisedimg,2)
  
      if r-n < 1 | n+r >= size(noisedimg,1) | c-n < 1 | c+n > size(noisedimg,2)
      GCorrigido(r,c) = verde(r,c);
      else
          fromrow=abs(r-n);
          torow=r+n;
          fromcol=abs(c-n);
          tocol=c+n;
          neig=verde(fromrow:torow,fromcol:tocol);
      localval=neig(:);
      s=sort(localval);
      somatorio=0;
      for i=d1+1:size(s,1)-d2
          somatorio=somatorio+s(i);
      end
      avg=(1/(n*n)-(d1+d2))*somatorio;
      GCorrigido(r,c)=avg;
      end
    end
  end
 
for r=1:size(noisedimg,1)
  for c=1:size(noisedimg,2)
      if r-n < 1 | n+r >= size(noisedimg,1) | c-n < 1 | c+n > size(noisedimg,2)
      BCorrigido(r,c) = azul(r,c);
      else
          fromrow=abs(r-n);
          torow=r+n;
          fromcol=abs(c-n);
          tocol=c+n;
          neig=azul(fromrow:torow,fromcol:tocol);
      localval=neig(:);
      s=sort(localval);
      somatorio=0;
      for i=d1+1:size(s,1)-d2
          somatorio=somatorio+s(i);
      end
      avg=(1/(n*n)-(d1+d2))*somatorio;
      BCorrigido(r,c)=avg;
      end
    end
  end

% Concatenamos todos os canais RGB
atmfimg = cat(3, RCorrigido, GCorrigido, BCorrigido);

end
