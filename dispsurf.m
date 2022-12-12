function dispsurf(cost)
h=surf(cost);
set(h,'LineStyle','none');
colorbar
colormap(jet(256));
end