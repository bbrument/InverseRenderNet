clear;
close all;

% Lecture et affichage de l'image source s :
image_name = 'demo';
s = imread([ image_name '.jpg' ]);
mask = imread([ image_name '_mask.jpg' ]);
[nb_row,nb_col,nb_c] = size(s);
figure;
imshow(s);
axis image off;
hold on;

% Section de l'image
nb_horizontal = 2;
nb_vertical = 2;
range_h = floor(nb_row/nb_horizontal);
range_v = floor(nb_col/nb_vertical);

for i = 1:nb_horizontal
    
    % Horizontal range
    deb_i = (i-1)*range_h+1;
    end_i = i*range_h;
    
    for j = 1:nb_vertical
        
        % Vertical range
        deb_j = (j-1)*range_v+1;
        end_j = j*range_v;
        
        % Save image
        imwrite(s(deb_i:end_i,deb_j:end_j,:), [ image_name int2str(i) int2str(j) '.jpg' ]);
        
        % Save mask
        imwrite(mask(deb_i:end_i,deb_j:end_j,:), [ image_name int2str(i) int2str(j) '_mask.jpg' ]);
        %imwrite(true(end_i-deb_i+1,end_j-deb_j+1), [ image_name int2str(i) int2str(j) '_mask.jpg' ]);
    end
end
