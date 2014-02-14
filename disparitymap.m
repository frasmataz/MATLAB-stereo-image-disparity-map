function [ dispmap ] = disparitymap( imageA, imageB )
%DISPARITYMAP Summary of this function goes here
%   Detailed explanation goes here
sampleSize = 4;
windowSize = 8;

%imageA = imread('C:\Users\Fraser\Desktop\leftsmall.bmp');
imageA = padarray(imageA, [round(sampleSize/2),round(sampleSize/2)]);

%imageB = imread('C:\Users\Fraser\Desktop\rightsmall.bmp');
imageB = padarray(imageB, [round(windowSize/2),round(windowSize/2)]);

dispmap = zeros(size(imageA, 1), size(imageA, 2));
window = zeros(windowSize, windowSize);
sampleA = zeros(sampleSize, sampleSize);

for i = (sampleSize/2)+1 : (size(imageA,1)-sampleSize/2) %LOOP THROUGH EACH PIXEL OF IMAGE A
    for j = (sampleSize/2)+1 : (size(imageA,2)-sampleSize/2)
        
        x = i-(sampleSize/2)+(windowSize/2);
        y = j -(sampleSize/2)+(windowSize/2);
        
        sampleA = imageA( i-(sampleSize/2) : i+(sampleSize/2) , j-(sampleSize/2) : j+(sampleSize/2) );
        
        window = imageB( x-(windowSize/2) : x+(windowSize/2)-1 , y-(windowSize/2) : y+(windowSize/2)-1 );
        
        max_x = 0;
        max_y = 0;
        maxSSD = 0;
        
        for k = 1 : windowSize - sampleSize
            for l = 1 : windowSize - sampleSize
                sampleB = window(k:k+sampleSize , l:l+sampleSize);
                
                ssd = 0;
                
                ssd = sum(sum(abs(sampleA-sampleB)));
                
                if ssd>maxSSD
                    maxSSD = ssd;
                    max_x = k;
                    max_y = l;
                end
            end
        end
        
        dispmap(i-(sampleSize/2),j-(sampleSize/2)) = max_x +max_y;
    end
end
