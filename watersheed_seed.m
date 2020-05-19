function labels= watersheed_seed(b)
D = bwdist(b);
DL = watershed(D);
bgm = DL == 0;
labels = imdilate(DL==0,ones(3,3)) + 2*bgm + 3*b;
end