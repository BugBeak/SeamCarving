function reduction(energy,newimage,dim,imdata,m,n,type)
if dim==1

            cost=my_cost(energy,1);
            reducewidth=input('Enter number of columns to reduce: ');
            %seams=[];
            dispseams=input('Enter \n 1. Display seams step wise  \n 2. Donot display seams \n');
            for k=1:reducewidth
                n=size(energy,2);
                [~, index]=min(cost(m,:));
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
                    index=ind;
                    seam(row,:)=[row index];

                end
                seamimage=disp_seam(newimage,seam);
                if (dispseams==1)
                    seamimg = 'seams'+string(k)+'.png';
                    ImageFolder = 'seams';
                    fullFileName = fullfile(ImageFolder,seamimg);
                    imwrite(seamimage, fullFileName);
                end
                %seams=cat(3,seams,seam);
                newimage=removeseam(newimage,seam,1);
                energy=energy_image(newimage,type);
                cost=my_cost(energy,1);
            end
            if (dispseams==1)
                dispvideo(reducewidth,1);
                for k=1:reducewidth
                seamimg = 'seams'+string(k)+'.png';
                ImageFolder = 'seams';
                fullFileName = fullfile(ImageFolder,seamimg);
                delete(fullFileName);
                end
            end

            figure
            subplot(1,2,1), imshow(imdata)
            subplot(1,2,2), imshow(newimage)
            pause
            close
elseif dim==2

            cost=my_cost(energy,2);

            reduceheight=input('Enter number of rows to reduce: ');
            %seams=[];
            dispseams=input('Enter \n 1. Display seams step wise  \n 2. Donot display seams \n');
            for k=1:reduceheight
                m=size(energy,1);
                [~, index]=min(cost(:,n));
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
                    index=ind;
                    seam(col,:)=[index col];
                end
                seamimage=disp_seam(newimage,seam);
                if (dispseams==1)
                    seamimg = 'seams'+string(k)+'.png';
                    ImageFolder = 'seams';
                    fullFileName = fullfile(ImageFolder,seamimg);
                    imwrite(seamimage, fullFileName);
                end
                %seams=cat(3,seams,seam);
                newimage=removeseam(newimage,seam,2);
                energy=energy_image(newimage,type);
                cost=my_cost(energy,2);
            end
            if (dispseams==1)
                dispvideo(reduceheight,1);
                for k=1:reduceheight
                seamimg = 'seams'+string(k)+'.png';
                ImageFolder = 'seams';
                fullFileName = fullfile(ImageFolder,seamimg);
                delete(fullFileName);
                end
            end

            figure
            subplot(1,2,1), imshow(imdata)
            subplot(1,2,2), imshow(newimage)
            pause
            close
elseif dim==3
    reducewidth=input('Enter number of columns to reduce: ');
    reduceheight=input('Enter number of rows to reduce: ');
    dispseams=input('Enter \n 1. Display seams step wise  \n 2. Donot display seams \n');
    which=input('Enter \n 1. Fast but not optimal\n 2. Slow but optimal method \n');
    if (which==1)
%         widthfirst=input('Reduce width first? (y/n) ','s');
%         if (widthfirst=='y')
            cost=my_cost(energy,1);
            for k=1:reducewidth
                n=size(energy,2);
                [~, index]=min(cost(m,:));
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
                    index=ind;
                    seam(row,:)=[row index];
                end
                seamimage=disp_seam(newimage,seam);
                if (dispseams==1)
                    seamimg = 'seams'+string(k)+'.png';
                    ImageFolder = 'seams';
                    fullFileName = fullfile(ImageFolder,seamimg);
                    imwrite(seamimage, fullFileName);
                end
                %seams=cat(3,seams,seam);
                newimage=removeseam(newimage,seam,1);
                energy=energy_image(newimage,type);
                cost=my_cost(energy,1);
            end
            n=size(energy,2);
            cost=my_cost(energy,2);

            for k=1:reduceheight
                m=size(energy,1);
                [~, index]=min(cost(:,n));
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
                    index=ind;
                    seam(col,:)=[index col]; 
                end
                seamimage=disp_seam(newimage,seam);
                if (dispseams==1)
                    seamimg = 'seams'+string(reducewidth+k)+'.png';
                    ImageFolder = 'seams';
                    fullFileName = fullfile(ImageFolder,seamimg);
                    imwrite(seamimage, fullFileName);
                end
                %seams=cat(3,seams,seam);
                newimage=removeseam(newimage,seam,2);
                energy=energy_image(newimage,type);
                cost=my_cost(energy,2);
            end
            if (dispseams==1)
                dispvideo(reducewidth+reduceheight,1);
                for k=1:reducewidth+reduceheight
                seamimg = 'seams'+string(k)+'.png';
                ImageFolder = 'seams';
                fullFileName = fullfile(ImageFolder,seamimg);
                delete(fullFileName);
                end
            end
            figure
            subplot(1,2,1), imshow(imdata)
            subplot(1,2,2), imshow(newimage)
            pause
            close
%         else
%         end
    else
    ccost=my_cost(energy,1);
    rcost=my_cost(energy,2);    
    kall=reduceheight+reducewidth;
    for i=1:kall
        m=size(energy,1);
        n=size(energy,2);
        [min_bot, cindex]=min(ccost(m,:));
        [min_right, rindex]=min(rcost(:,n));

        if (min_bot<min_right && reducewidth>0) ||  (reduceheight<0)
            reducewidth=reducewidth-1;
            seam=zeros(m,2);
            seam(m,:)=[m cindex];
            for row=m-1:-1:1
                if cindex==1 
                    [~, ind]=min([ccost(row,cindex) ccost(row,cindex+1)]);
                    ind=cindex+ind-1;
                elseif cindex==n
                    [~, ind]=min([ccost(row,cindex-1) ccost(row,cindex)]);
                    ind=cindex+ind-2;
                else
                    [~, ind]=min([ccost(row,cindex-1) ccost(row,cindex) ccost(row,cindex+1)]);
                    ind=cindex+ind-2;
                end
                cindex=ind;
                seam(row,:)=[row cindex];
            end
            newimage=removeseam(newimage,seam,1);
        else
            reduceheight=reduceheight-1;
            seam=zeros(n,2);
            seam(n,:)=[rindex n];
            for col=n-1:-1:1
                if rindex==1 
                    [~, ind]=min([rcost(rindex,col) rcost(rindex+1,col)]);
                    ind=rindex+ind-1;
                elseif rindex==m
                    [~, ind]=min([rcost(rindex-1,col) rcost(rindex,col)]);
                    ind=rindex+ind-2;
                else
                    [~, ind]=min([rcost(rindex-1,col) rcost(rindex,col) rcost(rindex+1,col)]);
                    ind=rindex+ind-2;
               end
               rindex=ind;
               seam(col,:)=[rindex col];
            end
            newimage=removeseam(newimage,seam,2);
        end
        seamimage=disp_seam(newimage,seam);
        if (dispseams==1)
            seamimg = 'seams'+string(i)+'.png';
            ImageFolder = 'seams';
            fullFileName = fullfile(ImageFolder,seamimg);
            imwrite(seamimage, fullFileName);
        end
        %seams=cat(3,seams,seam);
        energy=energy_image(newimage,type);
        ccost=my_cost(energy,1);
        rcost=my_cost(energy,2);
    end
    if (dispseams==1)
        dispvideo(kall,1);
        for k=1:kall
                seamimg = 'seams'+string(k)+'.png';
                ImageFolder = 'seams';
                fullFileName = fullfile(ImageFolder,seamimg);
                delete(fullFileName);
                end
    end
    figure
    subplot(1,2,1), imshow(imdata)
    subplot(1,2,2), imshow(newimage)
    pause
    close
    end
end