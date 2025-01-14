function [output,markxy,markm,shuf]= fillk(h1,w1,h2,w2,img,y,x,markxy,markm,path,shuf)
   u=img((y-1)*h2+1:y*h2,(x-1)*w2+1:x*w2,:);
   output=img;
  
  tas1=imresize(img,0.5);
  tas2=imresize(shuf,0.5);
  [e1,f1,g1]=size(tas1);
  zer=zeros(e1,25,3);
  % imshow(img,[]);
  %subplot(2,1,1);
  imshow([tas1 zer tas2],[]);
  
    if(((y+1)<=(h1/h2))&&(markxy(y+1,x)==0))
       [number,down]=choosdown(h1,w1,h2,w2,u,markm,path);
       markm(number)=1;
       [h,w]=size(down);
       %imshow(right,[]);
       output((y)*h2+1:y*h2+h2,(x-1)*w2+1:(x-1)*w2+w2,:)=down;
       markxy(y+1,x)=1;
       shuf=delshuf(h1,w1,h2,w2,shuf,down);
     %  [output,markxy,markm]=fillk(h1,w1,h2,w2,output,y+1,x,markxy,markm,path);
    end
   if((y+1)<=(h1/h2))
       [output,markxy,markm,shuf]=fillk(h1,w1,h2,w2,output,y+1,x,markxy,markm,path,shuf);
   end
 %  pause(3);
   if(((x+1)<=(w1/w2))&&(markxy(y,x+1)==0))
       [number,right]=choosright(h1,w1,h2,w2,u,markm,path);
       left=choosleft(h1,w1,h2,w2,right,path);
       if(((x==1)&&(y==1))||(psnr(u,left)>30))
        markm(number)=1;
         [h,w]=size(right);
       %imshow(right,[]);
        output((y-1)*h2+1:y*h2,(x)*w2+1:(x)*w2+w2,:)=right;
        markxy(y,x+1)=1;
        %delete(strcat(path,'Patch_',num2str(number),'.tif'));
        shuf=delshuf(h1,w1,h2,w2,shuf,right);
        [output,markxy,markm,shuf]=fillk(h1,w1,h2,w2,output,y,x+1,markxy,markm,path,shuf);
        
       end
   end
%       if(((x+1)<=(w1/w2)))
%         [output,markxy,markm]=fill(output,y,x+1,markxy,markm,path);
%       end
%    if(((y+1)<=(1200/240)))
%        [output,markxy,markm]=fill(output,y+1,x,markxy,markm,path);
%    end
       
end
