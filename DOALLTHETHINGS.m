leftImage = imread('C:\Users\Fraser\Desktop\mer.bmp');
rightImage = imread('C:\Users\Fraser\Desktop\mel.bmp');

leftImage = mean(leftImage, 3);
rightImage = mean(rightImage, 3);

leftsmall = imread('C:\Users\Fraser\Desktop\mer.bmp');
rightsmall = imread('C:\Users\Fraser\Desktop\mel.bmp');

worsemap = disparitymap(leftsmall, rightsmall);


badmap = disparity2reloaded(leftsmall, rightsmall);

dispmap = dispmap3ThisTimeItsPersonal(leftImage, rightImage);

waitfor(imshow(leftImage,[0,255]));
a = max(max(worsemap));
waitfor(imshow(worsemap,[0,a]));
a = max(max(badmap));
waitfor(imshow(badmap,[0,a]));
a = max(max(dispmap));
imshow(dispmap,[0,a]);