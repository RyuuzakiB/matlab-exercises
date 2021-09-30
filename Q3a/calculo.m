function [snr, psnr] = calculo(desvio, img, noisedimg)

img_max = double(max(max(img)));
img_min = double(min(min(img)));

A = (img_max - img_min);

snr =  10*log10(double(std2(img)^2/std2(img-noisedimg)^2));
psnr = 10*log10(double((A^2)/(std2(img-noisedimg)^2+0.00001)));

end
