function newimage= addseam (imdata,seam,dim)

m=size(imdata,1);
n=size(imdata,2);
if (dim==1)
    height=m;
    width=n+1;
else
    height=m+1;
    width=n;
end
newimage=uint8(zeros(height,width,3));
if (dim==1)
    for i=1:height
        col=1; 
        j=1;
        while(j<=width   )
            
            if (seam(i,2)==col)
                if col<n
                    newimage(i,j,:)=imdata(i,col,:);
                    j=j+1;
                    newpixel=uint8((double(imdata(i,col,:))+double(imdata(i,col+1,:)))/2);
                    newimage(i,j,:)=newpixel;
                else
                    newpixel=uint8((double(imdata(i,col,:))+double(imdata(i,col-1,:)))/2);
                    newimage(i,j,:)=newpixel;
                    j=j+1;
                    newimage(i,j,:)=imdata(i,col,:);
                end
            else
                newimage(i,j,:)=imdata(i,col,:);
            end
            col=col+1;
            j=j+1;
        end
    end
else
     for i=1:width
         row=1;   
         j=1;
        while( j<=height )       
            if (seam(i,1)==row)
                if row<m
                    newimage(j,i,:)=imdata(row,i,:);
                    j=j+1;
                    newpixel=uint8((double(imdata(row,i,:))+double(imdata(row+1,i,:)))/2);
                    newimage(j,i,:)=newpixel;
                else
                    newpixel=uint8((double(imdata(row,i,:))+double(imdata(row-1,i,:)))/2);
                    newimage(j,i,:)=newpixel;
                    j=j+1;
                    newimage(j,i,:)=imdata(row,i,:);
                end
            else
                newimage(j,i,:)=imdata(row,i,:);
            end
            row=row+1;
            j=j+1;
        end
    end
end
end
            