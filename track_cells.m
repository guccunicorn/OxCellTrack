%track
function track_cells(seg_dataset)

[nr nc]=size(seg_dataset);
contours={}; %store the contours for the video :)
centroids{}; %store the centroids for tracking
trajectories={}; %store the trajectories for the cells


for i=1:nc-1 % say nc-1 because you don't want to take data that doesn't exist
    contours{i}=imgrad(seg_dataset(i)); % compute the gradient of a segmented binary mask
    
    %finf the infotmation about the frame 
    stats = regionprops('table',seg_dataset{i},'Centroid',...
    'MajorAxisLength','MinorAxisLength'); %this is used to find the information about the connected regions
    centroids{i}=stats.Centroid; %obtain the information about the contour centroid.
    
    [n_cells x]=size(centroids{i}); %find the number of cells in the frame  
    
    %find the information for the next frame
    stats_next = regionprops('table',seg_dataset{i+1},'Centroid',...
    'MajorAxisLength','MinorAxisLength'); % information about the contours in the next frame
    centers_next=stats_next.Centroid; %centroids in the next frame
    
    %compute the euclidian distance between each two cells
    traj_pairs=euc_dist(centroids{i},centers_next)
    
    %connect the trajectory
    for k=1:n_cells
        
    end
%     imshow(BW)
%     hold on
%     plot(centers(:,1),centers(:,2),'b*')
%     hold off
end
