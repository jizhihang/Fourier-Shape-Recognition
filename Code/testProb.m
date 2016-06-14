function [certainty,nextView,newImage ] = testProb(object)
close all

% Load all the data
load robotData
load loadingVocab
load nodeCounts;


% Constants
c = ['y' 'c' 'b' 'r' 'k' 'm'];
num_frames=[];
plotall = 0;
depth = 6;

% Object hypothesis
%object = 3;
objectNum = 35;
startFrame = 0;
% dump1 = {};
% dump2 = {};
% dpos = 1;

%figure
results =[];
confmat =[];
poseEstimates = [];

for object= 1:1%objectNum
    switch (object)
      
        case 1
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\allBran\\segmented\\00001.bmp';
        case 2
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\banff\\segmented\\00001.bmp';        
        case 3
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\battery\\segmented\\00001.bmp';  
        case 4
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\can1\\segmented\\00001.bmp';        
        case 5
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\can2\\segmented\\00001.bmp';
        case 6
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\cup\\segmented\\00001.bmp';
        case 7
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\Curry1\\segmented\\00001.bmp';
        case 8        
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\Curry2\\segmented\\00001.bmp';
        case 9
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\Elephant\\segmented\\00001.bmp';
        case 10
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\fisherPrice\\segmented\\00001.bmp';
        case 11
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\handbag2\\segmented\\00001.bmp';        
        case 12
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\handbag3\\segmented\\00001.bmp';        
        case 13
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\handbag\\segmented\\00001.bmp';
        
        case 14
            inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\jewelryBox1\\segmented\\00001.bmp';
        case 15
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\jewelryBox2\\segmented\\00001.bmp';
        case 16
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\lemonBottle\\segmented\\00001.bmp';
        case 17
         inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\lensBox\\segmented\\00001.bmp';
        case 18        
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\mrMin\\segmented\\00001.bmp';
        case 19
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\robocop\\segmented\\00001.bmp';
        case 20
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\salad\\segmented\\00001.bmp';
        case 21
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\sauce1\\segmented\\00001.bmp';
        case 22
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\sauce2\\segmented\\00001.bmp';
        case 23
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\spice1\\segmented\\00001.bmp';
        case 24
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\spice2\\segmented\\00001.bmp';
        case 25
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\spice3\\segmented\\00001.bmp';
        case 26
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\spice4\\segmented\\00001.bmp';
        case 27
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\spice5\\segmented\\00001.bmp';
        
        case 28
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\spice6\\segmented\\00001.bmp';
        case 29
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\sprayCan1\\segmented\\00001.bmp';
        
        case 30
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\sprayCan2\\segmented\\00001.bmp';
        case 31
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\sprayCan\\segmented\\00001.bmp';
        
        case 32
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\teddyBear\\segmented\\00001.bmp';
        case 33
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\Toy\\segmented\\00001.bmp';
        
        case 34
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\wallE\\segmented\\00001.bmp';
        case 35
           inputImage = 'D:\\PhDWork\\Datasets\\NewOccluded\\zanzibar\\segmented\\00001.bmp';
      
    end
    disp('input Image');
    disp(inputImage);
    % we know which object it is - just want to verify
    % Unbiased prior
    PO = log(ones(1, objectNum) / objectNum);  
    %disp(PO);
    previousViews =startFrame;
  
    frameCount = 1;
    wantViews = [];
    views = 1;
    certainty = exp(PO(object));
    while ((exp(PO(object)) <0.8) && (views<=18))
         
         if (views==1)
            [originalFeatures1 currentNum ] = matchDesc(object,inputImage,robotData);  %match against all to  find the initial pose          
            poseEstimates(object,views) = currentNum;
            previousViews = currentNum;
            disp('currentNum');
            disp(currentNum);
         else
           poseEstimates(object,views) = nextView;         
          
           [originalFeatures1] = matchDesc2(object,newImage,robotData,nextView);
         end
       
         num = size(originalFeatures1,2);
         
         for i = 1:num
            %need to go through each feature at a time    
            desc = originalFeatures1(i).descriptor;
            des1 = nodeCenters{i}(:,:);  % the descriptors of the node centres
            % need to find the closest centre in the node structure
            curnode = 1;
            nodes = 1;%curnode;
            while (1)             
                if (length(children_ids) < curnode)
                    break
                end

                % HACK, WHAT ACTUALLY IS THE PROBLEM!!!!!
                if (isempty(curnode))
                    break
                end
                
                if (isempty(children_ids{curnode}))
                    break;
                end               

                des1 = nodeCenters{curnode}(:,:);  % the descriptors of the node centres

                dists = zeros(size(des1, 1), 1);
                for i=1:size(des1, 1)
                    dists(i) = norm(double(des1(i, :)) - double(desc));
                end

                [y i] = min(dists);       

                newid = children_ids{curnode}(i);
                [f i] = find(newid == ids);

                curnode = i;
                nodes = [nodes; curnode];
            end

            if (length(nodes) == depth)        
                for jj=depth:depth
                    PO = log(nodeCounts(nodes(jj), :)) + PO;            
                    PO = PO - log(sum(exp(PO)));                    
                end
                
            
            end
         
         end
        
        % get next viewpoint if threshold < 0.9
        failed = 0;
        if (views~=18)
            disp('object');
            disp(object);
          [newImage previousViews wantViews count failed nextView]= nextViewConf(views, previousViews, wantViews,object);
           disp(newImage);
        end;
        if failed
            break;
        end
        views = views+1;
     
    end   
    % want to save PO value and the number of views
    confmat = [confmat PO(object)];
    numViews(object) = views -1;

end
