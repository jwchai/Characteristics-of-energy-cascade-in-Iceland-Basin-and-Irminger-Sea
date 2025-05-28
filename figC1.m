clc;clear; close all;
load('./data/energyflux_spring_LS.mat')
load('./data/corase_iceland_spring.mat');

figure
set(gcf,'position',[0 50 800 600])
t = tiledlayout(2,3,'TileSpacing','Compact')
ax = nexttile(1)
h1 = plot((1./energyflux.kf)/1e3, energyflux.mean_SpecFlux(1:end),'Color',[0.00,0.4471,0.698],'LineWidth',3)
hold on
xlog
ylabel('Cascade [m^2s^{-3}]')
set(gca,'FontSize',18,'FontName','Times')
xlim([1 1e2])
ylim([-6e-8 3e-8])
line([1e0 1e3],[0 0],'LineStyle','--','Color','k')
[El, Eu] = spec_error(energyflux.mean_SpecFlux(1:end),19)
R = 1./energyflux.kf(1:end);
pic01 = fill([R(1:end)/1e3,fliplr(R(1:end))/1e3],[ Eu',fliplr(El')],[0.00,0.4471,0.698]);
set(pic01,'edgealpha', 0, 'facealpha', 0.3);
text(2,2.e-8,'(a) spring','FontSize',24)
xlabel('r [km]')
ax.Box = 'on';
ax.LineWidth = 1;
xticks ( [ 1 , 1e1 , 1e2  ] ) ; % 根据范围设置刻度 
xticklabels ( { '1' , '10' , '100'  } ) ; % 自定义刻度标签
yticks ( [-5e-8,-3e-8,0,3e-8,5e-8 ] ) ; % 根据范围设置刻度 
text(1.5,-5e-8,'Iceland Basin','FontSize',16,'Color',[.5,.5,.5],'BackgroundColor', 'w')

ax = nexttile(4)
h1 = plot(dist_axis, nanmean(trans,2),'Color',[0, 0.45, 0.15],'LineWidth',3)
xlog
xlabel('r [km]')
ax.Box = 'on';
ax.LineWidth = 1;
xlim([1 1e2])
ylim([-6e-8 3e-8])
hold on
fill([dist_axis, fliplr(dist_axis)], [upperBound, fliplr(lowerBound)],[0, 0.45, 0.15], 'FaceAlpha', 0.3, 'EdgeColor', 'none');
line([1 1e6],[0 0],'LineStyle','--','Color','k')
text(2,2.e-8,'(d) spring','FontSize',24)
set(gca,'FontSize',18,'FontName','Times')
xticks ( [ 1 , 1e1 , 1e2  ] ) ; % 根据范围设置刻度 
xticklabels ( { '1' , '10' , '100'  } ) ; % 自定义刻度标签
ylabel('Cascade [m^2s^{-3}]')
yticks ( [-5e-8,-3e-8,0,3e-8,5e-8 ] ) ; % 根据范围设置刻度 
text(1.5,-5e-8,'Iceland Basin','FontSize',16,'Color',[.5,.5,.5],'BackgroundColor', 'w')
%%
clear
load('./data/energyflux_summer_LS.mat');
load('./data/corase_iceland_summer.mat');

ax1 = nexttile(2)
h1 = plot((1./energyflux.kf)/1e3, energyflux.mean_SpecFlux(1:end),'Color',[0.00,0.4471,0.698],'LineWidth',3)
hold on
xlog
ylabel('Cascade [m^2s^{-3}]')
%title('Energy Input','interpreter','latex')
set(gca,'FontSize',18,'FontName','Times')
xlim([1 1e2])
ylim([-6e-8 3e-8])
line([1e0 1e3],[0 0],'LineStyle','--','Color','k')
[El, Eu] = spec_error(energyflux.mean_SpecFlux(1:end),19)
R = 1./energyflux.kf(1:end);
pic01 = fill([R(1:end)/1e3,fliplr(R(1:end))/1e3],[ Eu',fliplr(El')],[0.00,0.4471,0.698]);
set(pic01,'edgealpha', 0, 'facealpha', 0.3);
text(2,2.e-8,'(b) summer','FontSize',24)
xlabel('r [km]')
ax1.Box = 'on';
ax1.LineWidth = 1;
xticks ( [ 1 , 1e1 , 1e2  ] ) ; % 根据范围设置刻度 
xticklabels ( { '1' , '10' , '100'  } ) ; % 自定义刻度标签
yticks ( [-5e-8,-3e-8,0,3e-8,5e-8 ] ) ; % 根据范围设置刻度 
text(1.5,-5e-8,'Iceland Basin','FontSize',16,'Color',[.5,.5,.5],'BackgroundColor', 'w')

ax1 = nexttile(5)
h1 = plot(dist_axis, nanmean(trans,2),'Color',[0, 0.45, 0.15],'LineWidth',3)
xlog
xlabel('r [km]')
ax1.Box = 'on';
ax1.LineWidth = 1;
xlim([1 1e2])
ylim([-6e-8 3e-8])
hold on
fill([dist_axis, fliplr(dist_axis)], [upperBound, fliplr(lowerBound)],[0, 0.45, 0.15], 'FaceAlpha', 0.3, 'EdgeColor', 'none');
line([1 1e6],[0 0],'LineStyle','--','Color','k')
text(2,2.e-8,'(e) summer','FontSize',24)
set(gca,'FontSize',18,'FontName','Times')
xticks ( [ 1 , 1e1 , 1e2  ] ) ; % 根据范围设置刻度 
xticklabels ( { '1' , '10' , '100'  } ) ; % 自定义刻度标签
ylabel('Cascade [m^2s^{-3}]')
yticks ( [-5e-8,-3e-8,0,3e-8,5e-8 ] ) ; % 根据范围设置刻度 
text(1.5,-5e-8,'Iceland Basin','FontSize',16,'Color',[.5,.5,.5],'BackgroundColor', 'w')
hold on
dummyLS = plot(NaN, NaN, 'Color', [0.00,0.4471,0.698], 'LineWidth',3, ...
               'DisplayName', 'LS method');
dummyCoarse = plot(NaN, NaN, 'Color', [0, 0.45, 0.15], 'LineWidth',3, ...
                   'DisplayName', 'coarse-gain method');
hold off

% 创建 legend 并放在图的底部、横向排布
lg = legend([dummyLS, dummyCoarse], ...
            'Location','southoutside', ...   % 放在底部
            'Orientation','horizontal', ...  % 横向
            'Box','off', ...                 % 去掉 legend 边框（可选）
            'FontSize',24);                  % 字体大小（可根据需要调整）

%%
clear
load('./data/energyflux_fall_LS.mat');
load('./data/corase_iceland_fall.mat');
ax = nexttile(3)
h1 = plot((1./energyflux.kf)/1e3, energyflux.mean_SpecFlux(1:end),'Color',[0.00,0.4471,0.698],'LineWidth',3)
hold on
xlog
ylabel('Cascade [m^2s^{-3}]')
%title('Energy Input','interpreter','latex')
set(gca,'FontSize',18,'FontName','Times')
xlim([1 1e2])
ylim([-6e-8 3e-8])
line([1e0 1e3],[0 0],'LineStyle','--','Color','k')
[El, Eu] = spec_error(energyflux.mean_SpecFlux(1:end),19)
R = 1./energyflux.kf(1:end);
pic01 = fill([R(1:end)/1e3,fliplr(R(1:end))/1e3],[ Eu',fliplr(El')],[0.00,0.4471,0.698]);
set(pic01,'edgealpha', 0, 'facealpha', 0.3);
text(2,2.e-8,'(c) fall','FontSize',24)
xlabel('r [km]')
ax.Box = 'on';
ax.LineWidth = 1;
xticks ( [ 1 , 1e1 , 1e2  ] ) ; % 根据范围设置刻度 
xticklabels ( { '1' , '10' , '100'  } ) ; % 自定义刻度标签
yticks ( [-5e-8,-3e-8,0,3e-8,5e-8 ] ) ; % 根据范围设置刻度 
text(1.5,-5e-8,'Iceland Basin','FontSize',16,'Color',[.5,.5,.5],'BackgroundColor', 'w')

ax = nexttile(6)
h1 = plot(dist_axis, nanmean(trans,2),'Color',[0, 0.45, 0.15],'LineWidth',3)
xlog
xlabel('r [km]')
ax.Box = 'on';
ax.LineWidth = 1;
xlim([1 1e2])
ylim([-6e-8 3e-8])
hold on
fill([dist_axis, fliplr(dist_axis)], [upperBound, fliplr(lowerBound)],[0, 0.45, 0.15], 'FaceAlpha', 0.3, 'EdgeColor', 'none');
line([1 1e6],[0 0],'LineStyle','--','Color','k')
text(2,2.e-8,'(f) fall','FontSize',24)
set(gca,'FontSize',18,'FontName','Times')
xticks ( [ 1 , 1e1 , 1e2  ] ) ; % 根据范围设置刻度 
xticklabels ( { '1' , '10' , '100'  } ) ; % 自定义刻度标签
ylabel('Cascade [m^2s^{-3}]')
yticks ( [-5e-8,-3e-8,0,3e-8,5e-8 ] ) ; % 根据范围设置刻度 
text(1.5,-5e-8,'Iceland Basin','FontSize',16,'Color',[.5,.5,.5],'BackgroundColor', 'w')

filename = ['./figure/figureC1.png']
print('-dpng','-r300',filename)
