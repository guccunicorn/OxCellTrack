function segmented_dataset = segmentation_1()
dataset = cell(1,91);
segmented_dataset = cell(1,91);
%first load in the data
for j=1:91
    if j<10
        s=strcat('t','00',int2str(j),'.tif');
    else
        s=strcat('t','0',int2str(j),'.tif');
     end
        dataset{j} = imread(s);
        a=dataset{j};
        segmented_dataset{j} = segment_image(a);
end

end