clear;
close all;

% Lecture et affichage de l'image source s :
image_name = 'visage';
s = imread([ image_name '.jpg' ]);
[nb_lignes_s,nb_colonnes_s,nb_canaux] = size(s);
figure;
imshow(s);
axis image off;
hold on;

% Selection et affichage d'un polygone p dans s :
% disp('Selectionnez un polygone (double-clic pour valider)');
%[p1,x_p1,y_p1] = roipoly(s);
% [p2,x_p2,y_p2] = roipoly(s);
% [p3,x_p3,y_p3] = roipoly(s);
% p = ~(p1 | p2 | p3);
% p = ~p1;

p = true(nb_lignes_s,nb_colonnes_s);

% Sauvegarde p :
imwrite(p, [ image_name '_mask.jpg' ]);