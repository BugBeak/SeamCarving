 function dispvideo(n,sign)
images    = cell(n,1);
folder='seams'  ;
 for i=1:n
     seamimg = 'seams'+string(i)+'.png';
     fullFileName = fullfile(folder,seamimg);
     images{i} = imread(fullFileName );
 end
 if sign==1
     h=size(images{1},1);
     w=size(images{1},2);
     for i=2:n
         x=size(images{i},1);
         y=size(images{i},2);
         if x<h
             diff=h-x;
             if mod(diff,2)==0
                 
                 extra=uint8(zeros(1,y,3));
                 for j=1:diff/2
                    images{i}=[extra; images{i};extra];
                 end
             else
                 diff=h-x;
                 extra=uint8(zeros(1,y,3));
                 for j=1:diff/2
                    images{i}=[extra; images{i};extra];
                 end
                 images{i}=[extra; images{i}];
             end
         end
         x=size(images{i},1);
         y=size(images{i},2);
         if y<w
             diff=w-y;
             if mod(diff,2)==0
                 
                 extra=uint8(zeros(x,1,3));
                 for j=1:diff/2
                    images{i}=[extra images{i} extra];
                 end
             else
                 diff=w-y;
                 extra=uint8(zeros(x,1,3));
                 for j=1:diff/2
                    images{i}=[extra images{i} extra];
                 end
                 images{i}=[extra images{i}];
             end
         end     
     end
 else
     h=size(images{n},1);
     w=size(images{n},2);
     for i=1:n-1
         x=size(images{i},1);
         y=size(images{i},2);
         if x<h
             diff=h-x;
             if mod(diff,2)==0
                 
                 extra=uint8(zeros(1,y,3));
                 for j=1:diff/2
                    images{i}=[extra; images{i};extra];
                 end
             else

                 extra=uint8(zeros(1,y,3));
                 for j=1:diff/2
                    images{i}=[extra; images{i};extra];
                 end
                 images{i}=[extra; images{i}];
             end
         end
         x=size(images{i},1);
         y=size(images{i},2);
         if y<w
             diff=w-y;
             if mod(diff,2)==0
                 
                 extra=uint8(zeros(x,1,3));
                 for j=1:diff/2
                    images{i}=[extra images{i} extra];
                 end
             else
                 extra=uint8(zeros(x,1,3));
                 for j=1:diff/2
                    images{i}=[extra images{i} extra];
                 end
                 images{i}=[extra images{i}];
             end
         end     
     end
 end
 writerObj = VideoWriter('Velocity.avi');
 writerObj.FrameRate = 10;
 open(writerObj);
 for u=1:n    
       frame = im2frame(images{u});

         writeVideo(writerObj, frame);

 end
   % close the writer object
 close(writerObj);
 implay('Velocity.avi');
end