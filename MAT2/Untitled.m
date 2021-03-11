clc
close all
clear all

A = imread('image3.jpg');
R=A(:,:,1);
G=A(:,:,2);
B=A(:,:,3);
[n,m,c]=size(A);
%% ---part1---------------------------------------------
for i=1:n
    for j=1:m
        if A(i,j,1)>140
            I(i,j) = 1;
        else
            I(i,j) = 0;
        end
    end
end
figure 
title('R>140')
imshow(I);
for i=1:n
    for j=1:m
        if A(i,j,2)>140
            J(i,j) = 1;
        else
            J(i,j) = 0;
        end
    end
end
figure
title('G>140')
imshow(J);
for i=1:n
    for j=1:m
        if A(i,j,3)>140
            K(i,j) = 1;
        else
            K(i,j) = 0;
        end
    end
end
figure
title('B>140');
imshow(K);
for i=1:n
    for j=1:m
        if A(i,j,1)>140 && A(i,j,2)>140 && A(i,j,3)<30
            L(i,j) = 1;
        else
            L(i,j) = 0;
        end
    end
end
figure
title('R>140, G>140, B<30');
imshow(L);
for i=1:n
    for j=1:m
       grey(i,j) = ((A(i,j,1)+A(i,j,2)+A(i,j,3))/3);
    end
end
figure
title('(R+G+B)/3');
imshow(grey);

%% --part2--------------------------------------------------
M = grey;
%-----------------part2 b,c--------------------------------------------
O = M;
gaussnoise = 8*randn(size(O,1), size(O,2));
imgaussnoise = uint8(double(O) + gaussnoise);
figure
title('gaussnoiose image');
imshow(imgaussnoise);
O = imgaussnoise;
M = O;

temp = meanF(O,9);
figure
imshow(temp);

O = imgaussnoise;
M = O;
temp = meanF(O,25);
figure
title('gaussnoise mean filtered version with M=25');
imshow(temp);

O = imgaussnoise;
M = O;
temp = meanF(O,121);
figure
title('gaussnoise mean filtered version with M=121');
imshow(temp);

%-----------part2 d------------------------------------------------
O = grey;
gaussnoise = 32*randn(size(O,1), size(O,2));
imgaussnoise = uint8(double(O) + gaussnoise);

figure
title('gaussnoise with variance 1024');
imshow(imgaussnoise);
O = imgaussnoise;
M = O;

temp = meanF(O,9);
figure
title('gaussnoise with variance 1024 mean filtered version with M=9');
imshow(temp);

O = imgaussnoise;
M = O;
temp = meanF(O,25);
figure
title('gaussnoise with variance 1024 mean filtered version with M=25');
imshow(temp);

O = imgaussnoise;
M = O;
temp = meanF(O,121);
figure
title('gaussnoise with variance 1024 mean filtered version with M=121');
imshow(temp);


% Part2 -- %E,f---------------------------------------------------------

imsaltnoise = grey;
noisypixels = rand( size(grey,1), size(grey,2) );
imsaltnoise( find( noisypixels <= ( 1 / 16 ) ) ) = 255;
imsaltnoise( find( noisypixels >= ( 15 / 16 ) ) ) = 0;
figure
title('salt and pepper noise');
imshow(imsaltnoise);
O = imsaltnoise;
M = O;


temp = meanF(O,9);
figure
title('salt and pepper noise filtered using M=9');
imshow(temp);

O = imsaltnoise;
M = O;
temp = meanF(O,25);
figure
title('salt and pepper noise filtered using M=25');
imshow(temp);

O = imsaltnoise;
M = O;
temp = meanF(O,121);
figure
title('salt and pepper noise filtered using M=121');
imshow(temp);


%% Part3---------------------------------------------------------------
%------------------part3 b,c-----------------------------------------
O = grey;
M = O;
gaussnoise = 8*randn(size(O,1), size(O,2));
imgaussnoise = uint8(double(O) + gaussnoise);
figure
title('gaussnoise image');
imshow(imgaussnoise);
O = imgaussnoise;
M = O;

temp = medianF(O,9);
figure
title('gaussnoise image filtered using M=9');
imshow(temp);

O = imgaussnoise;
M = O;
temp = medianF(O,25);
figure
title('gaussnoise image filtered using M=25');
imshow(temp);
O = imgaussnoise;
M = O;
temp = medianF(O,121);
figure
title('gaussnoise image filtered using M=121');
imshow(temp);

%------part3 d-------------------------------------------
O = grey;
gaussnoise = 32*randn(size(O,1), size(O,2));
imgaussnoise = uint8(double(O) + gaussnoise);

figure
title('gaussnoise image with variance 1024');
imshow(imgaussnoise);
O = imgaussnoise;
M = O;

temp = medianF(O,9);
figure
title('gaussnoise image with variance 1024 filtered using M=9');
imshow(temp);
O = imgaussnoise;
M = O;
temp = medianF(O,25);
figure
title('gaussnoise image with variance 1024 filtered using M=25');
imshow(temp);
O = imgaussnoise;
M = O;
temp = medianF(O,121);
figure
title('gaussnoise image with variance 1024 filtered using M=121');
imshow(temp);

%------part3 e,f-------------------------------------------

imsaltnoise = grey;
noisypixels = rand( size(M,1), size(M,2) );
imsaltnoise( find( noisypixels <= ( 1 / 16 ) ) ) = 255;
imsaltnoise( find( noisypixels >= ( 15 / 16 ) ) ) = 0;
figure
title('salt and pepper image');
imshow(imsaltnoise);
O = imsaltnoise;
M = O;
temp = medianF(O,9);
figure
title('salt and pepper image filtered using M=9');
imshow(temp);
O = imsaltnoise;
M = O;
temp = medianF(O,25);
figure
title('salt and pepper image filtered using M=25');
imshow(temp);
O = imsaltnoise;
M = O;
temp = medianF(O,121);
figure
title('salt and pepper image filtered using M=121');
imshow(temp);


function f1 = meanF(I,Mi)
[n,m,c]=size(I);
M = I;
O = I;
N = double((sqrt(Mi)-1))/2;
f1 = [m;n];
for i=1:n
    for j=1:m
        com = 0;
        if i>N && i<n-N+1
            for k=(i-N):(i+N)
                com = M(k,j)+ com;
            end
        elseif i<N && i<n-N+1
            for k=(1):(i+N)
                com = M(k,j)+ com;
            end
        elseif i>N && i>n-N+1
            for k=(i-N):(n)
                com = M(k,j)+ com;
            end
        else
            for k=(1):(n)
                com = M(k,j)+ com;
            end
        end
        if j>N && j<m-N+1
            for k=(j-N):(j+N)
                com = M(i,k)+ com;
            end
        elseif j<N && j<m-N+1
            for k=(1):(j+N)
                com = M(i,k)+ com;
            end
        elseif j>N && j>m-N+1
            for k=(j-N):(m)
                com = M(i,k)+ com;
            end
        else
            for k=(1):(m)
                com = M(i,k)+ com;
            end
        end
        com = com/((2*N+1)^2);
        O(i,j) = com;
    end
end
f1 = uint8(O);
end

function f2=medianF(I,Mi)
[n,m,c]=size(I);
M = I;
O = I;
N = double((sqrt(Mi)-1))/2;
f2 = [m;n];
for i=1:n
    for j=1:m
        array = 1:1:(4*N+2);
        arr = 1;
        for k=(i-N):(i+N)
            if k>1 && k<n+1
                array(arr) = M(k,j);
                arr = arr+1;
            else
                array(arr) = 0;
                arr = arr+1;
            end
        end
        
        for k=(j-N):(j+N)
            if k>1 && k<m+1
               array(arr) = M(i,k);
               arr = arr+1;
            else
               array(arr) = 0;
               arr = arr+1;
            end
        end
        array = sort(array);
        array = median(array);
        O(i,j) = array;
    end
end
f2 = uint8(O);
end
