
function[newImage] = getNewImage(hypoObject,nextView)

switch (hypoObject)
     case 1
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\allBran\\segmented\\%0.5u.bmp', nextView);
    case 2
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\battery\\segmented\\%0.5u.bmp', nextView);
    case 3
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\can1\\segmented\\%0.5u.bmp', nextView)
    case 4
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\can2\\segmented\\%0.5u.bmp', nextView);
    case 5
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\curry1\\segmented\\%0.5u.bmp', nextView);
    case 6
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\curry2\\segmented\\%0.5u.bmp', nextView);
    case 7
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\elephant\\segmented\\%0.5u.bmp', nextView);
    
    case 8
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\handbag3\\segmented\\%0.5u.bmp', nextView);
   
    case 9
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\jewelryBox1\\segmented\\%0.5u.bmp', nextView);
    case 10
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\jewelryBox2\\segmented\\%0.5u.bmp', nextView);
    case 11
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\lemonBottle\\segmented\\%0.5u.bmp', nextView);
    
    case 12
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\mrMin\\segmented\\%0.5u.bmp', nextView);
   
    case 13
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\salad\\segmented\\%0.5u.bmp', nextView);
    case 14
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\sauce1\\segmented\\%0.5u.bmp', nextView);
    case 15
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\sauce2\\segmented\\%0.5u.bmp', nextView);
    case 16
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\spice1\\segmented\\%0.5u.bmp', nextView);
    case 17
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\spice2\\segmented\\%0.5u.bmp', nextView);
   
    case 18
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\sprayCan1\\segmented\\%0.5u.bmp', nextView);
    case 19
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\sprayCan2\\segmented\\%0.5u.bmp', nextView);
    case 20
        newImage = sprintf('D:\\PhDWork\\Datasets\\NewOccluded\\sprayCan\\segmented\\%0.5u.bmp', nextView);
   
    
   
   
end