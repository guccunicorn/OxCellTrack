 %[nr nc]=size(seg_dataset);
m=[];
for i=1:91 % say nc-1 because you don't want to take data that doesn't exist
    stats = regionprops('table',segmented_dataset2{i},'Centroid',...
    'MajorAxisLength','MinorAxisLength');
    centers=stats.Centroid;
    [nrc ncc]=size(centers);
    m(i)=nrc;
end
% plot(m)
% title('Cell Life Tracking')
% xlabel('No.frame') 
% ylabel('Number of cells present')