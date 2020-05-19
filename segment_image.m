%Software for segmentation
function g_tr4=segment_image(a)
% a=preprocess(a)
g=histeq(a, 256);
se_0=strel('disk', 38);
g0=imopen(g, se_0);
g_no_background=g-g0;
se_tr1=strel('disk',2);
g_tr1=imopen(g_no_background, se_tr1);
se_tr2=strel('disk',10);
g_tr2=imclose(g_tr1, se_tr2);
g_tr3=threshold_image(g_tr2);
se_tr3=strel('disk',11);
g_tr4=imopen(g_tr3,se_tr3);
end