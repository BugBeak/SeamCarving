clc
filename=input('Enter name of file with extension: ','s');

%filename='flickr.jpg';
imdata= imread(filename);

%energy=my_energy(imdata);
type=input('Enter energy function \n 1. e1 \n 2. entropy \n');
myenergy=energy_image(imdata,type);
m=size(myenergy,1);
n=size(myenergy,2);
fprintf('size of image is %d * %d \n',m,n);
task=0;


while(task~=4)

    newimage=imdata;
    energy=myenergy;
    task=input('Enter the number corresponding to the task to be performed \n 1. Display energy function \n 2. Decrease size \n 3. Increase size \n 4. Exit \n');  
    %=================================================================================================
    if (task==1)
      h=surf(myenergy);
      set(h,'LineStyle','none');
      colorbar
      colormap(jet(256));
    %=================================================================================================
    elseif(task==2)
        dim=input('Enter \n 1 for horizontal reduction \n 2 for vertical reduction \n 3 for both \n');
        %---------------------------------------------------------------------------------------------
        reduction(energy,newimage,dim,imdata,m,n,type)
    %=================================================================================================
    elseif (task==3)
        dim=input('Enter \n 1 for horizontal enlargement \n 2 for vertical enlargement \n 3 for both \n');
        %---------------------------------------------------------------------------------------------
        enlarge_improved(energy,newimage,dim,imdata,m,n)
    %=================================================================================================

    end
    clc
end
    


