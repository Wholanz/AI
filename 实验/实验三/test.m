clear all; close all; clc;


corrupted = importdata('corrupted.mat');
%mask = importdata('Mask.mat');

mask = ceil(corrupted);

figure;
imshow(corrupted);

corrupted_R = corrupted(:,:,1);   %取三个通道的值
corrupted_G = corrupted(:,:,2);
corrupted_B = corrupted(:,:,3);

mask_R = mask(:,:,1);
mask_G = mask(:,:,2);
mask_B = mask(:,:,3);
    
restore_R = Denoise(corrupted_R, mask_R, 0.48, 75, 0.013); %分别修复三个通道，需要输入misRatio,basisNum,sigma 
restore_G = Denoise(corrupted_G, mask_G, 0.48, 75, 0.013);
restore_B = Denoise(corrupted_B, mask_B, 0.48, 75, 0.013);

restore(:,:,1) = restore_R;
restore(:,:,2) = restore_G;
restore(:,:,3) = restore_B;

figure;
imshow(restore);

rms = sqrt(sum(sum(sum((corrupted - restore).^2))));

