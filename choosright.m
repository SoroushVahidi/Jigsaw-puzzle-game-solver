function [number,output]= choosright(h1,w1,h2,w2,img,markm,path)
  filepatt=fullfile(path,'*.tif');
  pngff=dir(filepatt);
  maxi=1000*1000;
  number=-1;
  for i=1:(h1/h2)*(w1/w2)-4
      if(markm(i)==0)
          J=im2double((imread(fullfile(path,pngff(i).name))));          
          q=ekhright(img,J);
          if((maxi>q))
              maxi=q;
              output=J;
            %  if(psnr(choosleft(h1,w1,h2,w2,J,path),J)>40)
                number=i;
             % end
          end
      end
  end  
end