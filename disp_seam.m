function imdata= disp_seam (imdata,seam)
n=size(seam);
for i=1:n
    point=seam(i,:);
    imdata(point(1),point(2),1)=255;
    imdata(point(1),point(2),2)=0;
    imdata(point(1),point(2),3)=0;
end
% figure
% imshow(imdata2)
end