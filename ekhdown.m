function output=ekhdown(img,J)
    [h,w,k]=size(img);
    
 %  pause(1);
    output=0;
    for i=1:w
        output=output+abs(img(h,i,1)-J(1,i,1))^2+abs(img(h,i,2)-J(1,i,2))^2+abs(img(h,i,3)-J(1,i,3))^2;
    end
end
 