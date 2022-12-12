function newimage= reduced (imdata,seams,dim)
red=size(seams,3);
m=size(imdata,1);
n=size(imdata,2);
if (dim==1)
    height=m;
    width=n-red;
else
    height=m-red;
    width=n;
end
seams(:,:,1)
newimage=uint8(zeros(height,width,3));
if (dim==1)
    for i=1:height
        col=[];
        for j=1:n
            copy=1;
            for k=1:red
                if j==seams(i,2,k) && (i==seams(i,1,k))
                    copy=0;
                end
            end
            if copy==1
                col=[col j];
            end
        end
        for j=1:width        
            newimage(i,j,:)=imdata(i,col(j),:);
        end
    end
else
    for i=1:width
        row=[]
        for j=1:m
            copy=1;
            for k=1:red
                if j==seams(i,2,k)
                    copy=0;
                end
            end
            if copy==1
                row=[row j];
            end
        end
        for j=1:height        
            newimage(j,i,:)=imdata(row(j),i,:);
        end
    end
end
end
            