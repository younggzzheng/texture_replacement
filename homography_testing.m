function homography_testing

% image = im2double(imread('testing/media/photo9.jpg'));
image = im2double(imread('concrete_Background.jpg'));

marker = im2double(imread('marker2.jpg'));
%transform = get_marker_homography(image,marker);
transform = surfTesting();

toPaste = im2double(imread('better_toPaste.png'));

outputView = imref2d(size(image));
Ir = imwarp(toPaste,transform,'OutputView',outputView);
composited = composite_images(image, toPaste, transform.T);
figure(123)
imshow(composited)


% mask = zeros(size(image));  
% one = ones(size(marker));
% comp = logical(composite_images(mask, one, transform.T));
% totalArea = bwarea(comp(:,:,1));
% halfWindowWidth = floor(1.3*sqrt(totalArea)/2);
% stats = regionprops(comp(:,:,1),'centroid');
% 
%  center= stats.Centroid;
%  centerX = center(1);
%  centerY = center(2);
%  
%  rect = [centerX-halfWindowWidth, centerY-halfWindowWidth, halfWindowWidth*2, halfWindowWidth*2];
%  
%  cutout = imcrop(image, rect);
% 
% imshow(cutout);




