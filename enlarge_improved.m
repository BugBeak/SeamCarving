function enlarge_improved(energy,newimage,dim,imdata,m,n)
maxcost=1.1;
if dim==1
            
            cost=my_cost(energy,1);
            addwidth=input('Enter number of columns to add: ');
            seams=[];
            dispseams=input('Enter \n 1. Display seams step wise  \n 2. Donot display seams \n');
            for k=1:addwidth
                n=size(energy,2);
                [~, index]=min(cost(m,:));
                cost(m,index)=maxcost;
                seam=zeros(m,2);
                seam(m,:)=[m index];
                for row=m-1:-1:1
                    if index==1 
                        [~, ind]=min([cost(row,index) cost(row,index+1)]);
                        ind=index+ind-1;
                    elseif index==n
                        [~, ind]=min([cost(row,index-1) cost(row,index)]);
                        ind=index+ind-2;
                    else
                        [~, ind]=min([cost(row,index-1) cost(row,index) cost(row,index+1)]);
                        ind=index+ind-2;
                    end
                    cost(row,ind)=maxcost;
                    index=ind;
                    seam(row,:)=[row index];

                end
                seamimage=disp_seam(newimage,seam);
                newimage=addseam (newimage,seam,dim);
                if (dispseams==1)
                    seamimg = 'seams'+string(k)+'.png';
                    ImageFolder = 'seams';
                    fullFileName = fullfile(ImageFolder,seamimg);
                    imwrite(seamimage, fullFileName);
                end
                seams=cat(3,seams,seam);
                
            end
            if (dispseams==1) 
                dispvideo(addwidth,2);
                for k=1:addwidth
                seamimg = 'seams'+string(k)+'.png';
                ImageFolder = 'seams';
                fullFileName = fullfile(ImageFolder,seamimg);
                delete(fullFileName);
                end
            end
            %newimage=enlarged(imdata,seams,1);
            figure
            subplot(1,2,1), imshow(imdata)
            subplot(1,2,2), imshow(newimage)
            pause
            close
elseif dim==2

            cost=my_cost(energy,2);
            
            addheight=input('Enter number of rows to add: ');
            seams=[];
            dispseams=input('Enter \n 1. Display seams step wise  \n 2. Donot display seams \n');
            for k=1:addheight
                m=size(energy,1);
                [~, index]=min(cost(:,n));
                cost(index,n)=maxcost;
                seam=zeros(n,2);
                seam(n,:)=[index n];
                
                for col=n-1:-1:1
                    if index==1 
                        [~, ind]=min([cost(index,col) cost(index+1,col)]);
                        ind=index+ind-1;
                    elseif index==m
                        [~, ind]=min([cost(index-1,col) cost(index,col)]);
                        ind=index+ind-2;
                    else
                        [~, ind]=min([cost(index-1,col) cost(index,col) cost(index+1,col)]);
                        ind=index+ind-2;
                    end
                    cost(ind,col)=maxcost;
                    index=ind;
                    seam(col,:)=[index col];
                end
                 seamimage=disp_seam(newimage,seam);
                newimage=addseam (newimage,seam,dim);
                 
                if (dispseams==1)
                    seamimg = 'seams'+string(k)+'.png';
                    ImageFolder = 'seams';
                    fullFileName = fullfile(ImageFolder,seamimg);
                    imwrite(seamimage, fullFileName);
                end
                seams=cat(3,seams,seam);

            end
            if (dispseams==1)
                dispvideo(addheight,2);
                for k=1:addheight
                seamimg = 'seams'+string(k)+'.png';
                ImageFolder = 'seams';
                fullFileName = fullfile(ImageFolder,seamimg);
                delete(fullFileName);
                end
            end
            %newimage=enlarged(imdata,seams,2);
            figure
            subplot(1,2,1), imshow(imdata)
            subplot(1,2,2), imshow(newimage)
            pause
            close
elseif dim==3
    addwidth=input('Enter number of columns to add: ');
    addheight=input('Enter number of rows to add: ');
    cseams=[];
    rseams=[];
    dispseams=input('Enter \n 1. Display seams step wise  \n 2. Donot display seams \n');
    cost=my_cost(energy,1);
    for k=1:addwidth
        n=size(energy,2);
        [~, index]=min(cost(m,:));
        cost(m,index)=maxcost;
        seam=zeros(m,2);
        seam(m,:)=[m index];
        for row=m-1:-1:1
            if index==1 
                [~, ind]=min([cost(row,index) cost(row,index+1)]);
                ind=index+ind-1;
            elseif index==n
                [~, ind]=min([cost(row,index-1) cost(row,index)]);
                ind=index+ind-2;
            else
                [~, ind]=min([cost(row,index-1) cost(row,index) cost(row,index+1)]);
                ind=index+ind-2;
            end
            cost(row,ind)=maxcost;
            index=ind;
            seam(row,:)=[row index];
        end
         seamimage=disp_seam(newimage,seam);
         newimage=addseam (newimage,seam,dim);
        if (dispseams==1)
            seamimg = 'seams'+string(k)+'.png';
            ImageFolder = 'seams';
            fullFileName = fullfile(ImageFolder,seamimg);
            imwrite(seamimage, fullFileName);
        end
        cseams=cat(3,cseams,seam);
    end
    for k=1:addheight
        m=size(energy,1);
        [~, index]=min(cost(:,n));
        cost(index,n)=maxcost;
        seam=zeros(n,2);
        seam(n,:)=[index n];
        for col=n-1:-1:1
            if index==1 
              	[~, ind]=min([cost(index,col) cost(index+1,col)]);
                ind=index+ind-1;
            elseif index==m
                [~, ind]=min([cost(index-1,col) cost(index,col)]);
                ind=index+ind-2;
            else
                [~, ind]=min([cost(index-1,col) cost(index,col) cost(index+1,col)]);
                ind=index+ind-2;
            end
            cost(ind,col)=maxcost;
            index=ind;
            seam(col,:)=[index col]; 
        end
         seamimage=disp_seam(newimage,seam);
        newimage=addseam (newimage,seam,dim);

        if (dispseams==1)
          	seamimg = 'seams'+string(addwidth+k)+'.png';
            ImageFolder = 'seams';
            fullFileName = fullfile(ImageFolder,seamimg);
            imwrite(seamimage, fullFileName);
        end
        rseams=cat(3,rseams,seam);
    end
    if (dispseams==1)
      	dispvideo(addwidth+addheight,2);
        for k=1:addwidth+addheight
            seamimg = 'seams'+string(k)+'.png';
            ImageFolder = 'seams';
            fullFileName = fullfile(ImageFolder,seamimg);
            delete(fullFileName);
        end
    end
    %newimage=enlarged(imdata,seams,2);
    figure
    subplot(1,2,1), imshow(imdata)
    subplot(1,2,2), imshow(newimage)
    pause
    close


end