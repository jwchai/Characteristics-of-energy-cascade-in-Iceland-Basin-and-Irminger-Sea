clc;clear;close all

clear
load('./data/linear_ice_spring.mat')
figure
set(gcf,'position',[0 50 1800 1200])
t = tiledlayout(2,3,'TileSpacing','Compact')
ax = nexttile
[~,h1] = contourf(kvec*1e3,lvec*1e3,wi_max*3600*24,100)
h1.LineStyle = 'none'
colorbar

colormap(flip(othercolor('RdYlBu_11b',100)));
colorbar
xt = [8 8];
yt= [-16 -16];
hold on
xticks([-2 -1 0 1 2])
yticks([-2 -1 0 1 2])
scatter(kvec(locy)*1e3,lvec(locx)*1e3,80,'k','filled','^')
text(-1.7, 1.7, '(a) Spring','FontSize',24)
set( gca , 'fontsize' ,16 );
caxis([0 0.05])
text(1,-1.8,'Iceland Basin','FontSize',16,'Color',[.5,.5,.5],'BackgroundColor', 'w')

%%

clear
load('./data/linear_ice_summer.mat')
nexttile

[~,h1] = contourf(kvec*1e3,lvec*1e3,wi_max*3600*24,100)
h1.LineStyle = 'none'
colorbar

colormap(flip(othercolor('RdYlBu_11b',100)));
colorbar
xt = [8 8];
yt= [-16 -16];
hold on
xticks([-2 -1 0 1 2])
yticks([-2 -1 0 1 2])

scatter(kvec(locy([3,9,16,12,13,22]))*1e3,lvec(locx([3,9,16,12,13,22]))*1e3,80,'k','filled','^')
text(-1.7, 1.7, '(b) Summer','FontSize',24)
set( gca , 'fontsize' ,16 );
caxis([0 0.05])
text(1,-1.8,'Iceland Basin','FontSize',16,'Color',[.5,.5,.5],'BackgroundColor', 'w')

%%

nexttile
clear
load('./data/linear_ice_fall.mat')
[~,h1] = contourf(kvec*1e3,lvec*1e3,wi_max*3600*24/2,100)
h1.LineStyle = 'none'
colorbar

colormap(flip(othercolor('RdYlBu_11b',100)));
colorbar
xt = [8 8];
yt= [-16 -16];
hold on
xticks([-2 -1 0 1 2])
yticks([-2 -1 0 1 2])

scatter(kvec(locy([2,21,9,14,8,15]))*1e3,lvec(locx([2,21,9,14,8,15]))*1e3,80,'k','filled','^')

text(-1.7, 1.7, '(c) Fall','FontSize',24)
set( gca , 'fontsize' ,16 );
caxis([0 0.05])
text(1,-1.8,'Iceland Basin','FontSize',16,'Color',[.5,.5,.5],'BackgroundColor', 'w')
% filename = ['/Users/chaijunwei/Documents/energyflux/2025-4-5/figure/iceland_linear.png']
% print('-dpng','-r300',filename)
%%

clear
load('./data/linear_irm_spring.mat')
nexttile
[~,h1] = contourf(kvec*1e3,lvec*1e3,wi_max*3600*24/2,100)
h1.LineStyle = 'none'
colorbar

colormap(flip(othercolor('RdYlBu_11b',100)));
colorbar
xt = [8 8];
yt= [-16 -16];
hold on
xticks([-2 -1 0 1 2])
yticks([-2 -1 0 1 2])

scatter(kvec(locy)*1e3,lvec(locx)*1e3,80,'k','filled','^')
text(-1.7, 1.7, '(d) Spring','FontSize',24)
set( gca , 'fontsize' ,16 );
caxis([0 0.05])
text(1,-1.8,'Irminmger Sea','FontSize',16,'Color',[.5,.5,.5],'BackgroundColor', 'w')

%%

clear
load('./data/linear_irm_summer.mat')
nexttile
[~,h1] = contourf(kvec*1e3,lvec*1e3,wi_max*3600*24/3,100)
h1.LineStyle = 'none'
colorbar

colormap(flip(othercolor('RdYlBu_11b',100)));
colorbar
xt = [8 8];
yt= [-16 -16];
hold on
xticks([-2 -1 0 1 2])
yticks([-2 -1 0 1 2])

scatter(kvec(locy)*1e3,lvec(locx)*1e3,80,'k','filled','^')
text(-1.7, 1.7, '(e) Summer','FontSize',24)
set( gca , 'fontsize' ,16 );
caxis([0 0.05])
text(1,-1.8,'Irminger Sea','FontSize',16,'Color',[.5,.5,.5],'BackgroundColor', 'w')

%%

clear
load('./data/linear_irm_fall.mat')
nexttile
[~,h1] = contourf(kvec*1e3,lvec*1e3,wi_max*3600*24/2,100)
h1.LineStyle = 'none'
colorbar

colormap(flip(othercolor('RdYlBu_11b',100)));
colorbar
xt = [8 8];
yt= [-16 -16];
hold on
xticks([-2 -1 0 1 2])
yticks([-2 -1 0 1 2])

scatter(kvec(locy(4:7))*1e3,lvec(locx(4:7))*1e3,80,'k','filled','^')

text(-1.7, 1.7, '(f) Fall','FontSize',24)
set( gca , 'fontsize' ,16 );
caxis([0 0.05])
text(1,-1.8,'Irminger Sea','FontSize',16,'Color',[.5,.5,.5],'BackgroundColor', 'w')
filename = ['./figure/figure10.png']
print('-dpng','-r300',filename)
