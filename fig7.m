
clc; clear; close all;

% 加载结构体数据（一次性包含四季）
load('./data/SF3_seasonal_results_irminger.mat');  % 包含变量 seasonal_results

season_list = {'winter', 'spring', 'summer', 'autumn'};
panel_labels = {'(a) winter', '(b) spring', '(c) summer', '(d) fall'};

% 创建画布
figure
set(gcf, 'position', [0 50 1000 600])
t = tiledlayout(1, 4, 'TileSpacing', 'Compact');

for i = 1:4
    % 取出每季数据
    data = seasonal_results.(season_list{i});
    sf3 = data.sf3_mean;
    dist_axis = data.dist_axis(:);
    err = data.standard_error(:);
    
    % 计算均值
    sf3_mean = nanmean(sf3, 2);

    % 筛选 dist_axis 范围 4 km 到 200 km
    mask = dist_axis >= 4e3 & dist_axis <= 2e5;
    x = dist_axis(mask);
    y = abs(sf3_mean(mask));
    y_err = err(mask);

    % 绘图
    ax = nexttile;
    hold on
    plot(x, y, 'LineWidth', 6, 'Color', [0.8500 0.3250 0.0980]);    % 垂直误差线
    errorbar(x, y, y_err, ...
    'CapSize', 10, ...           % 控制误差帽子宽度（像“工字”横杠）
    'Color', [0.4 0.4 0.4], ...  % 更柔和的灰色
    'LineWidth', 1.5);    
    % 主线


    % 镜像负向散点
    scatter(x, -sf3_mean(mask), 100, [0, 0.4470, 0.7410], 'filled')

    % 设置对数坐标轴
    set(gca, 'XScale', 'log', 'YScale', 'log');
    xlim([1e3, 2e5]);
    ylim([1e-6, 1e-1]);

    xticks([1e3, 1e4, 1e5]);
    xticklabels({'1', '10', '100'});
    xlabel('[km]', 'FontSize', 24);
    if i == 1
        ylabel('[m^3s^{-3}]', 'FontSize', 24);
    end

    ax.Box = 'on';
    ax.LineWidth = 1;

    % 趋势线
    loglog(logspace(3, 5.3, 10), 1e-8 * logspace(3, 5.3, 10), '--k', 'LineWidth', 2);
    loglog(logspace(3, 5.3, 10), 1e-17 * logspace(3, 5.3, 10).^3, '--k', 'LineWidth', 2);

    % 注释
    text(2e3, 5e-2, panel_labels{i}, 'FontSize', 24);
    text(8e3, 1.5e-6, 'Iceland Basin', 'FontSize', 16, ...
         'Color', [.5, .5, .5], 'BackgroundColor', 'w');
    text(3000, 1.5e-6, '1', 'FontSize', 16, 'Color', [.5, .5, .5]);
    text(1500, 8e-6, '3', 'FontSize', 16, 'Color', [.5, .5, .5]);
end

% 保存图像
filename = './figure/figure7.png';
print('-dpng', '-r600', filename);