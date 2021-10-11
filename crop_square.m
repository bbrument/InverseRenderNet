clear;
close all;

% Lecture et affichage de l'image source s :
image_name = 'bb8';
s = imread([ image_name '.jpg' ]);
m = imread([ image_name '_mask.jpg' ]);
[nb_lignes_s,nb_colonnes_s,nb_canaux] = size(s);
figure;
imshow(s);
axis image off;
hold on;

% Square points
[x,y] = ginput(2);
x = floor(x);
y = floor(y);
plot(x, y, 'b+')

min_side = min([nb_lignes_s,nb_colonnes_s]);

for i = 1:2
    if x(i) < 0
        x(i) = 1;
    end
    if x(i) > min_side + min(x) - 1
        x(i) = min_side + min(x) - 1;
    end
    if y(i) < 0
        y(i) = 1;
    end
    if y(i) > min_side + min(y) - 1
        y(i) = min_side + min(y) - 1;
    end
end
plot(x,y,'rx')

% Save square image
cropped_s = s(min(y):max(y), min(x):max(x), :);
cropped_m = m(min(y):max(y), min(x):max(x), :);
figure,
imshow(cropped_s)
imwrite(cropped_s, [image_name '_square.jpg'])
imwrite(cropped_m, [image_name '_square_mask.jpg'])