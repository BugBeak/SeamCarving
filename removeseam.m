function newimage= removeseam (imdata,seam,dim)
m=size(imdata,1);
n=size(imdata,2);
if (dim==1)
    height=m;
    width=n-1;
else
    height=m-1;
    width=n;
end
newimage=uint8(zeros(height,width,3));
if (dim==1)
    for i=1:height
        col=1;      
        for j=1:width        
            if (seam(i,2)==col)
                col=col+1;
            end
            newimage(i,j,:)=imdata(i,col,:);
            col=col+1;
        end
    end
else
     for i=1:width
        row=1;      
        for j=1:height        
            if (seam(i,1)==row)
                row=row+1;
            end
            newimage(j,i,:)=imdata(row,i,:);
            row=row+1;
        end
    end
end
end
            