clear;
close all;

% Load data
dossier = 'bb8_square_results/';
img = imread([dossier 'img.png']);
albedo = imread([dossier 'albedo.png']);
normal = imread([dossier 'nm_pred.png']);
load([dossier 'lightings.mat']);

% figure;
% imshow(img)

% Pre-process
albedo = double(albedo) / 255;
normal = double(normal) / 255 * 2 - 1;
lightings = squeeze(lightings);
nb_rows = size(albedo,1);
nb_cols = size(albedo,2);
nb_pixels = nb_rows*nb_cols;
normal_vect = reshape(normal, nb_pixels,3);
albedo_vect = reshape(albedo,nb_pixels,3);

% Augmented normals
% A = tf.stack([c4*ones, 
%    2*c2*nm_[:,1], 
%    2*c2*nm_[:,2], 
%    2*c2*nm_[:,0], 
%    2*c1*nm_[:,0]*nm_[:,1], 
%    2*c1*nm_[:,1]*nm_[:,2], 
%    c3*nm_[:,2]**2-c5, 
%    2*c1*nm_[:,2]*nm_[:,0], 
%    c1*(nm_[:,0]**2-nm_[:,1]**2)], axis=-1)

c1 = 0.429043;
c2 = 0.511664;
c3 = 0.743125;
c4 = 0.886227;
c5 = 0.247708;
normalA = [c4*ones(nb_pixels,1), 2*c2*normal_vect(:,2), 2*c2*normal_vect(:,3), 2*c2*normal_vect(:,1), ...
    2*c1*normal_vect(:,1).*normal_vect(:,2), 2*c1*normal_vect(:,2).*normal_vect(:,3), c3*normal_vect(:,3).^2-c5, ...
    2*c1*normal_vect(:,3).*normal_vect(:,1), c1*(normal_vect(:,1).^2-normal_vect(:,2).^2)];

img_recomp = reshape(albedo_vect.*(normalA*lightings),nb_rows,nb_cols,3);
% figure;
% imshow(img_recomp)
imwrite(img_recomp,[dossier 'img_rcmp.png'])