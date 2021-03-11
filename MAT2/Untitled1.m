clc
close all
clear all

I = imread('image3part4.jpg');
figure
imshow(I);

x = [1 0 -1; 2 0 -2; 1 0 -1];
y = [1 2 1; 0 0 0; -1 -2 -1];

Gxr = conv2(x, I(:,:,1));
Gxg = conv2(x, I(:,:,2));
Gxb = conv2(x, I(:,:,3));
Gyr = conv2(y, I(:,:,1));
Gyg = conv2(y, I(:,:,2));
Gyb = conv2(y, I(:,:,3));

r = (Gxr.^2) + (Gyr.^2);
g = (Gxg.^2) + (Gyg.^2);
b = (Gxb.^2) + (Gyb.^2);
Gr = sqrt(r);
Gg = sqrt(g);
Gb = sqrt(b);

G(:,:,1) = Gr;
G(:,:,2) = Gg;
G(:,:,3) = Gb;

G = uint8(G);
figure
imshow(G);
