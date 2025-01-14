function output= choosleft(h1,w1,h2,w2,img,path)
  filepatt=fullfile(path,'*.tif');
  pngff=dir(filepatt);
  maxi=1000*1000;
  for i=1:(h1/h2)*(w1/w2)-4
          J=im2double((imread(fullfile(path,pngff(i).name))));
          
          q=ekhright(J,img);
          if(maxi>q)
              maxi=q;
              output=J;
              
          end
      
  end  
end