function [ disp ] = disparity2reloaded( imageA, imageB )
%DISPARITY2RELOADED Summary of this function goes here
%   Detailed explanation goes here
    sampleSize = 4;
    windowSize = 6;

    disp = zeros(size(imageA,1),size(imageA,2));
    
    imageA=padarray(imageA, [sampleSize/2,sampleSize/2]);
    imageB=padarray(imageB, [windowSize/2,windowSize/2]);
    
    
    for i = (1 : size(imageA,1) - sampleSize)
        for j = (1 : size(imageA,2) - sampleSize)
            
            x=0;
            y=0;
            max_x = 0;
            max_y = 0;
            maxSSD = 678825257223354;
            SSDs = zeros(windowSize-sampleSize, windowSize-sampleSize);
            
            sampleA = imageA( i:i+sampleSize , j:j+sampleSize );
            window = imageB( i:i+windowSize, j:j+windowSize );
            
            for k = (1 : windowSize - sampleSize)
               for l = (1 : windowSize - sampleSize)
                  sampleB = window( k:k+sampleSize , l:l+sampleSize ); 
                  
                  SSDs(k,l) = max( max( abs(sampleA - sampleB) ) );
                  

                  %maxSSD = max( max( SSDs ));
               end
            end
            
            [x,y] = find(SSDs == min(SSDs(:)));
            max_x = x(1);
            max_y = y(1);
            
            disp(i,j) = sqrt(max_x^2 + max_y^2);
        end
    end
    
    %imshow(disp);
end

