clear

path='E:\computer vision\final project\final\backup_linkedin\patches_2_160\';
im=im2double(imread('E:\computer vision\final project\final\backup_linkedin\Puzzle_2_160\Output.tif'));
shuf=im2double(imread('E:\computer vision\final project\final\backup_linkedin\Puzzle_2_160\Shuffled_Patches.tif'));
filepatt=fullfile(path,'*.tif');
 pngff=dir(filepatt);
 J=im2double((imread(fullfile(path,pngff(1).name))));
 [h1,w1,k1]=size(im);
 [h2,w2,k2]=size(J);
shuf=delshuf(h1,w1,h2,w2,shuf,im(1:h2,1:w2,:));
shuf=delshuf(h1,w1,h2,w2,shuf,im(1:h2,w1-w2+1:w1,:));
shuf=delshuf(h1,w1,h2,w2,shuf,im(h1-h2+1:h1,1:w2,:));
shuf=delshuf(h1,w1,h2,w2,shuf,im(h1-h2+1:h1,w1-w2+1:w1,:));
markxy=zeros(h1/h2,w1/w2);
markxy(1,1)=1;
markxy(1,w1/w2)=1;
markxy(h1/h2,1)=1;
markxy(h1/h2,w1/w2)=1;
markm=zeros((h1/h2)*(w1/w2)-4);
[output,markxy,markm]=fillk(h1,w1,h2,w2,im,1,1,markxy,markm,path,shuf);
output=fillk(h1,w1,h2,w2,output,1,w1/w2,markxy,markm,path,shuf);
imshow(output,[]);




