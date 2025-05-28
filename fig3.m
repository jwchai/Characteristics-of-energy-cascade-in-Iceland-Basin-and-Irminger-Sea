clc;clear;close all
load('./data/SF2_ice_results.mat');
figure
set(gcf, 'position', [0 50 800 800])
t = tiledlayout(2, 2, 'TileSpacing', 'Compact');

mask = dist_axis >= 4e3 & dist_axis <= 2e5;
x = dist_axis(mask);
y = abs(sf2_mean(mask));
y_err = standard_error_sf2(mask);

% 避免 log-scale 出现非正数
y(y <= 0) = 1e-9;
y_err(y_err < 0) = 0;
y_err(y - y_err <= 0) = y(y - y_err <= 0) * 0.5;

ax = nexttile;
hold on
plot(x, y, 'LineWidth', 6, 'Color',[0.00,0.4471,0.698]);    % 垂直误差线
errorbar(x, y, y_err, ...
'CapSize', 10, ...           % 控制误差帽子宽度 
'Color', [0.4 0.4 0.4], ...  
'LineWidth', 1.5);    

% 镜像负向散点
scatter(x, -sf2_mean(mask), 100, [0, 0.4470, 0.7410], 'filled')

% 设置对数坐标轴
set(gca, 'XScale', 'log', 'YScale', 'log');
xlim([1e3, 5e5]);
ylim([3e-3, 1e-1]);

xticks([1e3, 1e4, 1e5]);
xticklabels({'1', '10', '100'});
xlabel('[km]', 'FontSize', 24);

    ylabel('[m^2s^{-2}]', 'FontSize', 24);


ax.Box = 'on';
ax.LineWidth = 1;

% 趋势线
lin = loglog(logspace(1,6,10), 1e-4*logspace(1,6,10).^(2/3), '--k', 'LineWidth', 2);
lin = loglog(logspace(1,6,10), 1e-9*logspace(1,6,10).^2, '--k', 'LineWidth', 2);

% 注释
text(2e4, 4e-3, 'Iceland Basin', 'FontSize', 16, ...
     'Color', [.5, .5, .5], 'BackgroundColor', 'w');
text(1500, 2.5e-2, '2/3', 'FontSize', 16, 'Color', [.5, .5, .5]);
text(4000, 4e-3, '2', 'FontSize', 16, 'Color', [.5, .5, .5]);
set(ax,'FontSize',16)
text(1500, 8e-2, '(a)', 'FontSize', 24, 'FontWeight', 'bold')

%%
clear
load('./data/SF2_ice_results.mat');

mask = dist_axis >= 4e3 & dist_axis <= 2e5;
x = dist_axis(mask);
y = abs(sf3_mean(mask));
y_err = standard_error(mask);

ax = nexttile;
hold on
plot(x, y, 'LineWidth', 6, 'Color', [0.8500 0.3250 0.0980]);    % 垂直误差线
errorbar(x, y, y_err, ...
'CapSize', 10, ...           % 控制误差帽子宽度 
'Color', [0.4 0.4 0.4], ...  
'LineWidth', 1.5);    
% 主线


% 镜像负向散点
scatter(x, -sf3_mean(mask), 100, [0, 0.4470, 0.7410], 'filled')

% 设置对数坐标轴
set(gca, 'XScale', 'log', 'YScale', 'log');
xlim([1e3, 5e5]);
ylim([1e-6, 1e-2]);

xticks([1e3, 1e4, 1e5]);
xticklabels({'1', '10', '100'});
xlabel('[km]', 'FontSize', 24);

    ylabel('[m^3s^{-3}]', 'FontSize', 24);


ax.Box = 'on';
ax.LineWidth = 1;

% 趋势线
loglog(logspace(3, 6, 10), 1e-8 * logspace(3, 6, 10), '--k', 'LineWidth', 2);
loglog(logspace(3, 6, 10), 1e-17 * logspace(3, 6, 10).^3, '--k', 'LineWidth', 2);

% 注释
text(2e4, 1.9e-6, 'Iceland Basin', 'FontSize', 16, ...
     'Color', [.5, .5, .5], 'BackgroundColor', 'w');
text(3000, 2e-5, '1', 'FontSize', 16, 'Color', [.5, .5, .5]);
text(8000, 2e-5, '3', 'FontSize', 16, 'Color', [.5, .5, .5]);
set(ax,'FontSize',16)
text(1500, 5e-3, '(b)', 'FontSize', 24, 'FontWeight', 'bold')

%%
clc;clear
load('./data/SF2_irm_results.mat');

mask = dist_axis >= 4e3 & dist_axis <= 2e5;
x = dist_axis(mask);
y = abs(sf2_mean(mask));
y_err = standard_error_sf2(mask);

% 避免 log-scale 出现非正数
y(y <= 0) = 1e-9;
y_err(y_err < 0) = 0;
y_err(y - y_err <= 0) = y(y - y_err <= 0) * 0.5;

ax = nexttile;
hold on
plot(x, y, 'LineWidth', 6, 'Color',[0.00,0.4471,0.698]);    % 垂直误差线
errorbar(x, y, y_err, ...
'CapSize', 10, ...           % 控制误差帽子宽度 
'Color', [0.4 0.4 0.4], ...  
'LineWidth', 1.5);    

% 镜像负向散点
scatter(x, -sf2_mean(mask), 100, [0, 0.4470, 0.7410], 'filled')

% 设置对数坐标轴
set(gca, 'XScale', 'log', 'YScale', 'log');
xlim([1e3, 5e5]);
ylim([3e-3, 1e-1]);

xticks([1e3, 1e4, 1e5]);
xticklabels({'1', '10', '100'});
xlabel('[km]', 'FontSize', 24);

ylabel('[m^3s^{-3}]', 'FontSize', 24);

ax.Box = 'on';
ax.LineWidth = 1;

% 趋势线
lin = loglog(logspace(1,6,10), 1e-4*logspace(1,6,10).^(2/3), '--k', 'LineWidth', 2);
lin = loglog(logspace(1,6,10), 1e-9*logspace(1,6,10).^2, '--k', 'LineWidth', 2);

% 注释
text(2e4, 4e-3, 'Irminger Sea', 'FontSize', 16, ...
     'Color', [.5, .5, .5], 'BackgroundColor', 'w');
text(1500, 2.5e-2, '2/3', 'FontSize', 16, 'Color', [.5, .5, .5]);
text(4000, 4e-3, '2', 'FontSize', 16, 'Color', [.5, .5, .5]);
set(ax,'FontSize',16)
text(1500, 8e-2, '(c)', 'FontSize', 24, 'FontWeight', 'bold')

%%
clear
load('./data/SF2_irm_results.mat');

mask = dist_axis >= 4e3 & dist_axis <= 2e5;
x = dist_axis(mask);
y = abs(sf3_mean(mask));
y_err = standard_error(mask);

% 避免 log-scale 出现非正数
y(y <= 0) = 1e-9;
y_err(y_err < 0) = 0;
y_err(y - y_err <= 0) = y(y - y_err <= 0) * 0.5;
ax = nexttile;
hold on
plot(x, y, 'LineWidth', 6, 'Color', [0.8500 0.3250 0.0980]);    % 垂直误差线
errorbar(x, y, y_err, ...
'CapSize', 10, ...           % 控制误差帽子宽度 
'Color', [0.4 0.4 0.4], ...  
'LineWidth', 1.5);    
% 主线


% 镜像负向散点
scatter(x, -sf3_mean(mask), 100, [0, 0.4470, 0.7410], 'filled')

% 设置对数坐标轴
set(gca, 'XScale', 'log', 'YScale', 'log');
xlim([1e3, 5e5]);
ylim([1e-6, 1e-2]);

xticks([1e3, 1e4, 1e5]);
xticklabels({'1', '10', '100'});
xlabel('[km]', 'FontSize', 24);

    ylabel('[m^2s^{-2}]', 'FontSize', 24);


ax.Box = 'on';
ax.LineWidth = 1;

% 趋势线
loglog(logspace(3, 6, 10), 1e-8 * logspace(3, 6, 10), '--k', 'LineWidth', 2);
loglog(logspace(3, 6, 10), 1e-17 * logspace(3, 6, 10).^3, '--k', 'LineWidth', 2);

% 注释
text(2e4, 1.9e-6, 'Irminger Sea', 'FontSize', 16, ...
     'Color', [.5, .5, .5], 'BackgroundColor', 'w');
text(3000, 2e-5, '1', 'FontSize', 16, 'Color', [.5, .5, .5]);
text(8000, 2e-5, '3', 'FontSize', 16, 'Color', [.5, .5, .5]);
set(ax,'FontSize',16)
text(1500, 5e-3, '(d)', 'FontSize', 24, 'FontWeight', 'bold')

print('-dpng','-r600','./figure/figure3.png')