function cost = my_cost (energy,dim)
m=size(energy,1);
n=size(energy,2);
cost=zeros(m,n);
if dim==1 %top to bottom
    for i=2:m
        cost(i,1)=energy(i,1)+min([cost(i-1,1) cost(i-1,2)]);
        for j=2:n-1
            cost(i,j)=energy(i,j)+min([cost(i-1,j-1) cost(i-1,j) cost(i-1,j+1)]);
        end
        cost(i,n)=energy(i,n)+min([cost(i-1,n) cost(i-1,n-1)]);    
            
    end
else
    for i=2:n
        cost(1,i)=energy(1,i)+min([cost(1,i-1) cost(2,i-1)]);
        for j=2:m-1
            cost(j,i)=energy(j,i)+min([cost(j-1,i-1) cost(j,i-1) cost(j+1,i-1)]);
        end
        cost(m,i)=energy(m,i)+min([cost(m,i-1) cost(m-1,i-1)]);    
           
    end
end
cmin=min(cost,[],'all');
cost=cost-cmin;
cmax=max(cost,[],'all');
cost=cost/cmax;

end