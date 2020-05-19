
function fout=threshold_image(f)
f1=medfilt2(f);
T=mean2(f1); %initial estimation
count=0;
done=false;
while done
    count=count+1;
    g1=f1 > T;
    g2=f1 <= T;
    newT=0.5*(mean2(g1)+mean2(g2));
    done=abs(T-Tnew)<0.2;
    T=newT;
end
fout=im2bw(f1, T/(2^8-1));
end