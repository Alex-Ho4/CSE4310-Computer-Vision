function ocean_segmentation(input)

% convert image from uint8 to double
input = double(input);

% create convolution kernel to find straight x and y edges
dx = [-1 0 1; -2 0 2; -1 0 1] / 8;
dy = dx';

% apply convolution to image for x and y
dxgray = abs(imfilter(input, dx, 'symmetric'));
dygray = abs(imfilter(input, dy, 'symmetric'));

% calculate the gradient norms
grad_norms = (dxgray.^2 + dygray.^2).^0.5;

% gradient norms greater than 5 are in the mountains and the land, isolate
% both and create a variable "noise" that contains everything except the
% ocean and the sky
noise = grad_norms > 5;
noise = remove_holes(noise) > 1;
noise = bwareafilt(noise, 5);

% find the sky by getting pixels with a gray value above 190 and is not
% part of the mountains or land and get the largest connected area
figure(1);
sky = ~remove_holes(~(input >= 190 & noise == 0));
sky = bwareafilt(sky, 1);
imshow(sky, []);

% find the ocean by subtracting the sky and noise from the image and get
% the two largest connected areas
figure(2);
ocean = (noise == 0 & sky == 0);
ocean = bwareafilt(ocean, 2);
imshow(ocean, []);

end

