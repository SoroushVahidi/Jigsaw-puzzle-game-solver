function shuf=delshuf(h1,w1,h2,w2,shuf,ax)

    for i=1:h1/h2
        for j=1:w1/w2
            if(psnr(ax,shuf((i-1)*h2+1:i*h2,(j-1)*w2+1:j*w2,:))>30)
              shuf((i-1)*h2+1:i*h2,(j-1)*w2+1:j*w2,:)=0;
            end
        end
    end
end 