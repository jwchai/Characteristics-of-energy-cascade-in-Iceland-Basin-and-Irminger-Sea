%% spec fig1
%% 2023_Mar_14
%%
clc;clear;close all

load('./topo.mat')

filelist1 = listAllFiles ('./iceland/data/');
filelist2 = listAllFiles ('./Irminger/data/');
for nn = 1:12
x_time(nn,:) = datestr(['2012-',num2str(nn),'-01'],'mmm');
end
figure
set( gcf , 'position' , [ 0 50 800 600 ] );
t = tiledlayout(2,2,'TileSpacing','Compact')
t.TileSpacing = 'compact';
t.Padding = 'compact';
nexttile([1,2])
m_proj('miller','lon',[-48 -5],'lat',[55 68])
topo(topo>0) = nan;
[cs,h1] = m_contourf(LN,LT,topo);
h1.LineStyle = 'none'
hold on

[~,h2] = m_contour(LN,LT,topo);
h2.LevelList = [-1200 -1200]
h2.LineColor = 'k'
h2.LineWidth = 1.5
hold on
m_gshhs_f('patch',[.5 .5 .5]);
m_grid('linest','none','tickdir','out','box','fancy','fontsize',16);
colormap(m_colmap('blues'));  
caxis([-4000 0]);
[ax,h]=m_contfbar([.06 .25],.78,cs,h1,'endpiece','no','axfrac',.05,'FontSize',9,'FontWeight','bold');
title(ax,'meters','FontWeight','bold','FontSize',10)
set(gcf,'color','w');  % otherwise 'print' turns lakes black
hold on
m_text(-53,67.7,'(a)','FontSize',16,'FontWeight','bold')

for ii = 1:length(filelist1)
    load(filelist1{ii})
m_scatter(lon,lat,1,'r')
end
for ii = 1:length(filelist2)
  load(filelist2{ii})
    loc = find(lon>-40);
m_scatter(lon(loc),lat(loc),1,'r')
end
m_text(-21,65, 'Iceland','FontSize',12,'FontWeight','bold','color','k')
m_text(-46,60.9, 'Greenland','FontSize',12,'FontWeight','bold','color','k','rotation',60)
m_text(-39.5,62, 'Irminger sea','FontSize',16,'FontWeight','bold','color','k','rotation',25)
m_text(-32,57, 'Iceland basin','FontSize',16,'FontWeight','bold','color','k')
lon = lon - 360;
bndry_lon1=[lon(115) lon(155) lon(180) lon(140) lon(115)];
bndry_lat1=[lat(30) lat(30) lat(45) lat(45) lat(30)];
bndry_lon2=[lon(71) lon(110) lon(135) lon(95) lon(71)];
bndry_lat2=[lat(30) lat(30) lat(50) lat(50) lat(30)];

m_line(bndry_lon1,bndry_lat1,'linewi',3,'color','k','LineStyle','--');     % Area outline ...
m_line(bndry_lon2,bndry_lat2,'linewi',3,'color','k','LineStyle','--');     % Area outline ...



nexttile([1,1])
load './data/monthly_counts_iceland.mat' 
n1 = zeros(12,1);
bar(1:12,num)
set(gca,'xtick',1:12, 'xticklabel',x_time)
set(gca,'FontSize',14,'FontWeight','bold','fontname','Times')
ylim([0 20])

title('(b)','position',[.7,17],'FontSize',16,'FontWeight','bold')

nexttile([1,1])
load './data/monthly_counts_irminger.mat' 

bar(1:12,num)
set(gca,'xtick',1:12, 'xticklabel',x_time)
ylim([0 15])
set(gca,'FontSize',14,'FontWeight','bold','fontname','Times')
title('(c)','position',[.7,13],'FontSize',16,'FontWeight','bold')
print('-dpng','-r600',['./figure/fig1.png'])
