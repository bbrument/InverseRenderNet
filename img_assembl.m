clear;
close all;

% Lecture et affichage de l'image source s :
image_name = 'demo';
s = imread([ image_name '.jpg' ]);
[nb_row,nb_col,nb_c] = size(s);

nb_horizontal = 2;
nb_vertical = 2;
range_h = floor(nb_row/nb_horizontal);
range_v = floor(nb_col/nb_vertical);

for i = 1:nb_horizontal
    
    deb_i = (i-1)*range_h+1;
    end_i = i*range_h;
    
    for j = 1:nb_vertical
        
        deb_j = (j-1)*range_v+1;
        end_j = j*range_v;
        
        dossier = ['demo' int2str(i) int2str(j) '_results/'];
        s_ = imread([dossier 'img_rcmp.png']);
        
        c(deb_i:end_i,deb_j:end_j,:) = s_;
     
    end
end

figure;
imshow(c);
axis image off;
hold on;

imwrite(c,['demo11_results/img_assembled.png'])