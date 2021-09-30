I=imread('images/chapeu.png');
figure, imshow(I);
newI1 = Floyd_Steinberg_Dithering(I);
figure, imshow(newI1);