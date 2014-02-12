function [ dispmap ] = disparitymap( )
%DISPARITYMAP Summary of this function goes here
%   Detailed explanation goes here
    sampleSize = 5;
    windowSize = 10;
    
    imageA = imread('C:\Users\Fraser\Desktop\pentagon_left.bmp');
    imageA = padarray(imageA, [round(sampleSize/2),round(sampleSize/2)]);
    
    imageB = imread('C:\Users\Fraser\Desktop\pentagon_right.bmp');
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
            
            for k = 1 : windowSize - sampleSize
                for l = 1 : windowSize - sampleSize
                    sampleB = window(k:k+sampleSize , l:l+sampleSize);
                    
                    if sampleA == sampleB
                        dispmap((i-sampleSize/2),(j-sampleSize/2)) = 0;
                    else
                        dispmap((i-sampleSize/2),(j-sampleSize/2)) = 255;
                end
            end
        end
    end
    imshow(dispmap);
end

    