clear
clc

%Matlab assignment 2 - image 0 - 21701824 ID
A = imread('image3.jpg');  %reading the image0 jpeg file, 3-D matrix
[m, n, c] = size(A); %getting the dimension of the image
%disp(m)         %height - Row
%disp(n)         %width - Column
%disp(c)         %RGB

%%PART 1
%a
mat_1 = zeros(m,n); %initializing binary matrix to 0

for i = 1:m %number of rows
    for j = 1:n %number of columns
       if A(i,j,1) > 140 %if R > 140
           mat_1(i,j) = 1;
       end
    end    
end

image = imshow(mat_1);   %part a done
title("R > 140");
drawnow;
waitfor(image);

%b
mat_2 = zeros(m,n); %initializing binary matrix to 0
for i = 1:m %number of rows
    for j = 1:n %number of columns
       if A(i,j,2) > 140 %if G > 140
           mat_2(i,j) = 1;
       end
    end    
end

image = imshow(mat_2);   %part b done
title("G > 140");
drawnow;
waitfor(image);

%c
mat_3 = zeros(m,n); %initializing binary matrix to 0
for i = 1:m %number of rows
    for j = 1:n %number of columns
       if A(i,j,3) > 140 %if B > 140
           mat_3(i,j) = 1;
       end
    end    
end

image = imshow(mat_3);   %part c done
title("B > 140");
drawnow;
waitfor(image);

%d
mat_4 = zeros(m,n); %initializing binary matrix to 0
for i = 1:m %number of rows
    for j = 1:n %number of columns
       if (A(i,j,1) > 140)&&(A(i,j,2) > 140)&&(A(i,j,3) < 30) %R&B>140,B<30
           mat_4(i,j) = 1;
       end
    end    
end

image = imshow(mat_4);   %part d done
title("R > 140, G > 140, B < 30");
drawnow;
waitfor(image);

%e
mat_5 = zeros(m,n); %creating empty matrix for gray.jpeg

for i = 1:m %number of rows
    for j = 1:n %number of columns
        mat_5(i,j) = (A(i,j,1)+ A(i,j,2)+ A(i,j,3)) / 3;
    end    
end

mat_5 = uint8(mat_5);
image = imshow(mat_5);   %part e done
title("Grayscale image0");
drawnow;
waitfor(image);  
imwrite(mat_5,'gray.jpg')

%%PART 2
%a is done below as funciton definition

%b
imgray = imread('gray.jpg');
gaussnoise = 8*randn(size(imgray,1), size(imgray,2));
imgaussnoise = uint8(double(imgray) + gaussnoise);
image = imshow(imgaussnoise);   %part b done
title("adding zero-mean Gaussian noise with variance 64 to the image");
drawnow;
waitfor(image);

%c
%M = 9;
M = 9;
J = filter(imgaussnoise, M);
image = imshow(J);
title("part c filter with M = 9");
drawnow;
waitfor(image);

%M = 25;
M = 25;
J = filter(imgaussnoise, M);
image = imshow(J);
title("part c filter with M = 25");
drawnow;
waitfor(image);

%M = 121.
M = 121;
J = filter(imgaussnoise, M);
image = imshow(J);
title("part c filter with M = 121");
drawnow;
waitfor(image);

%d
imgray = imread('gray.jpg');
gaussnoise = 32*randn(size(imgray,1), size(imgray,2));
imgaussnoise = uint8(double(imgray) + gaussnoise);
image = imshow(imgaussnoise);   %part d done
title("adding zero-mean Gaussian noise with variance 1024 to the image");
drawnow;
waitfor(image);

%M = 9;
M = 9;
J = filter(imgaussnoise, M);
image = imshow(J);
title("part d filter with M = 9");
drawnow;
waitfor(image);

%M = 25;
M = 25;
J = filter(imgaussnoise, M);
image = imshow(J);
title("part d filter with M = 25");
drawnow;
waitfor(image);

%M = 121.
M = 121;
J = filter(imgaussnoise, M);
image = imshow(J);
title("part d filter with M = 121");
drawnow;
waitfor(image);

%e
imsaltnoise = imgray;
noisypixels = rand( size(imgray,1), size(imgray,2) );
imsaltnoise( find( noisypixels <= ( 1 / 16 ) ) ) = 255;
imsaltnoise( find( noisypixels >= ( 15 / 16 ) ) ) = 0;
image = imshow(imsaltnoise);
title("imsaltnoise picture");
drawnow;
waitfor(image);

%f
%M = 9;
M = 9;
J = filter(imsaltnoise, M);
image = imshow(J);
title("part e filter with M = 9");
drawnow;
waitfor(image);

%M = 25;
M = 25;
J = filter(imsaltnoise, M);
image = imshow(J);
title("part e filter with M = 25");
drawnow;
waitfor(image);

%M = 121.
M = 121;
J = filter(imsaltnoise, M);
image = imshow(J);
title("part e filter with M = 121");
drawnow;
waitfor(image);


%%PART 3
%a is done below as funciton definition

%b
imgray = imread('gray.jpg');
gaussnoise = 8*randn(size(imgray,1), size(imgray,2));
imgaussnoise = uint8(double(imgray) + gaussnoise);
image = imshow(imgaussnoise);   %part b done
title("adding zero-mean Gaussian noise with variance 64 to the image");
drawnow;
waitfor(image);

%c
%M = 9;
M = 9;
J = medFilter(imgaussnoise, M);
image = imshow(J);
title("part c filter with M = 9");
drawnow;
waitfor(image);

%M = 25;
M = 25;
J = medFilter(imgaussnoise, M);
image = imshow(J);
title("part c filter with M = 25");
drawnow;
waitfor(image);

%M = 121.
M = 121;
J = medFilter(imgaussnoise, M);
image = imshow(J);
title("part c filter with M = 121");
drawnow;
waitfor(image);

%d
imgray = imread('gray.jpg');
gaussnoise = 32*randn(size(imgray,1), size(imgray,2));
imgaussnoise = uint8(double(imgray) + gaussnoise);
image = imshow(imgaussnoise);   %part d done
title("adding zero-mean Gaussian noise with variance 1024 to the image");
drawnow;
waitfor(image);

%M = 9;
M = 9;
J = medFilter(imgaussnoise, M);
image = imshow(J);
title("part d filter with M = 9");
drawnow;
waitfor(image);

%M = 25;
M = 25;
J = medFilter(imgaussnoise, M);
image = imshow(J);
title("part d filter with M = 25");
drawnow;
waitfor(image);

%M = 121.
M = 121;
J = medFilter(imgaussnoise, M);
image = imshow(J);
title("part d filter with M = 121");
drawnow;
waitfor(image);

%e
imsaltnoise = imgray;
noisypixels = rand( size(imgray,1), size(imgray,2) );
imsaltnoise( find( noisypixels <= ( 1 / 16 ) ) ) = 255;
imsaltnoise( find( noisypixels >= ( 15 / 16 ) ) ) = 0;
image = imshow(imsaltnoise);
title("imsaltnoise picture");
drawnow;
waitfor(image);

%f
%M = 9;
M = 9;
J = medFilter(imsaltnoise, M);
image = imshow(J);
title("part e filter with M = 9");
drawnow;
waitfor(image);

%M = 25;
M = 25;
J = medFilter(imsaltnoise, M);
image = imshow(J);
title("part e filter with M = 25");
drawnow;
waitfor(image);

%M = 121.
M = 121;
J = medFilter(imsaltnoise, M);
image = imshow(J);
title("part e filter with M = 121");
drawnow;
waitfor(image);


%%PART 4
I = imread('image0part4.jpg');
image = imshow(I);
title("image0part4");
drawnow;
waitfor(image);

mt_1 = [1 0 -1; 2 0 -2; 1 0 -1]; %for x
mt_2 = [1 2 1; 0 0 0; -1 -2 -1]; %for y

%solve for G_x and G_y
G_xr = conv2(mt_1, I(:,:,1));
G_xg = conv2(mt_1, I(:,:,2));
G_xb = conv2(mt_1, I(:,:,3));

G_yr = conv2(mt_2, I(:,:,1));
G_yg = conv2(mt_2, I(:,:,2));
G_yb = conv2(mt_2, I(:,:,3));

%combining r,g,b
r = (G_xr.^2) + (G_yr.^2);
g = (G_xg.^2) + (G_yg.^2);
b = (G_xb.^2) + (G_yb.^2);
G_r = sqrt(r);
G_g = sqrt(g);
G_b = sqrt(b);

%making G
G(:,:,1) = G_r;
G(:,:,2) = G_g;
G(:,:,3) = G_b;

G = uint8(G);
image = imshow(G);
title("image0part4 after applying Sobel operator");
drawnow;
waitfor(image);

%Part 2a - function definition
function J = filter(I,M)
[m, n] = size(I); %getting the dimension of the image
%this method mean filters the image I
J = zeros(m,n); %initiating J matrix, return matrix
N = (sqrt(M) - 1) / 2;  %the value of N
for i = 1:m
    for j = 1:n
        %accessing each pixel and adding with surrounding pixels
        totalVal = 0.0;
        for a = (i - N):1:(i + N)
            for b = (j - N):1:(j + N)
                val = 0;
                if ((a > 0 && a <= m)&&(b > 0 && b <= n))
                   val = double(I(a,b)); 
                end
                totalVal = totalVal + val;
            end
        end
        J(i,j)= totalVal / M;
    end
end
J = uint8(J);
end

%Part 3a - function definition
function J = medFilter(I,M)
[m, n] = size(I); %getting the dimension of the image
%this method median filters the image I
J = zeros(m,n); %initiating J matrix, return matrix
N = (sqrt(M) - 1) / 2;  %the value of N
for i = 1:m
    for j = 1:n
        %accessing each pixel and adding with surrounding pixels
        count = 0;
        val = zeros(M,1);
        for a = (i - N):1:(i + N)
            for b = (j - N):1:(j + N)
                count = count + 1;
                if ((a > 0 && a <= m)&&(b > 0 && b <= n))
                   val(count) = double(I(a,b)); 
                end
            end
        end
        %median
        J(i,j) = median(val);
    end
end
J = uint8(J);
end