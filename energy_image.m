function energyImage =  energy_image(img,type)

    m=size(img,1);
    top=img(1,:,:);
    bottom=img(m,:,:);
    img=[top; img;bottom];
    n=size(img,2);
    left=img(:,1,:);
    right=img(:,n,:);
    img=[left img right];

if type==1
    [~, ~, d] = size(img);
    if (d == 3)
        [Ix, Iy] = gradient(double(rgb2gray(img)));
    else
        [Ix, Iy] = gradient(double(img_reduced));
    end
    energyImage = abs(Ix) + abs(Iy);
elseif type==2
    [row,col,n] = size(img);
    if(n == 3)
        im = rgb2gray(img);
    end
    energyImage =  entropyfilt(im) ;
end


m=size(energyImage,1);
n=size(energyImage,2);
energyImage=energyImage(2:m-1,2:n-1);
img=img(2:m-1,2:n-1,:);
end