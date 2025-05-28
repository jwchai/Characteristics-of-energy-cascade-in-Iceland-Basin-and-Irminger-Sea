%%
clc; clear; 
season_list = {'winter', 'spring', 'summer', 'autumn'};
panel_labels = {'(a) winter', '(b) spring', '(c) summer', '(d) fall','(e) winter', '(f) spring', '(g) summer', '(h) fall'};

% 创建画布
figure
set(gcf, 'position', [0 50 1000 600])
t = tiledlayout(2, 4, 'TileSpacing', 'Compact');
load('./data/SF2_seasonal_results_iceland.mat');  % 包含变量 seasonal_results

for i = 1:4
    % 取出每季数据
    data = seasonal_results.(season_list{i});
    sf2 = data.sf2_mean;
    dist_axis = data.dist_axis(:);
    err = data.standard_error(:);
    
    % 筛选 dist_axis 范围 4 km 到 200 km
    mask = dist_axis >= 4e3 & dist_axis <= 2e5;
    x = dist_axis(mask);
    y = abs(sf2(mask));
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
    scatter(x, -sf2(mask), 100, [0, 0.4470, 0.7410], 'filled')

    % 设置对数坐标轴
    set(gca, 'XScale', 'log', 'YScale', 'log');
    xlim([1e3, 2e5]);
    ylim([3e-3, 1e0]);

    xticks([1e3, 1e4, 1e5]);
    xticklabels({'1', '10', '100'});
    xlabel('[km]', 'FontSize', 24);
    if i == 1
        ylabel('[m^3s^{-3}]', 'FontSize', 24);
    end

    ax.Box = 'on';
    ax.LineWidth = 1;

    % 趋势线
    lin = loglog(logspace(1,6,10), 1e-4*logspace(1,6,10).^(2/3), '--', 'color', [0.5, 0.5, 0.5]);
    lin = loglog(logspace(1,6,10), 1e-9*logspace(1,6,10).^2, '--', 'color', [0.5, 0.5, 0.5]);

    % 注释
    text(2e3, 6e-1, panel_labels{i}, 'FontSize', 24);
    text(8e3, 5e-3, 'Iceland Basin', 'FontSize', 16, ...
         'Color', [.5, .5, .5], 'BackgroundColor', 'w');
    text(1500, 2.5e-2, '2/3', 'FontSize', 16, 'Color', [.5, .5, .5]);
    text(2000, 4e-3, '2', 'FontSize', 16, 'Color', [.5, .5, .5]);
    set(ax,'FontSize',16)
end



% 创建画布
load('./data/SF2_seasonal_results_irminger.mat');  % 包含变量 seasonal_results


for i = 1:4
    % 取出每季数据
    data = seasonal_results.(season_list{i});
    sf2 = data.sf2_mean;
    dist_axis = data.dist_axis(:);
    err = data.standard_error(:);
    
    % 筛选 dist_axis 范围 4 km 到 200 km
    mask = dist_axis >= 4e3 & dist_axis <= 2e5;
    x = dist_axis(mask);
    y = abs(sf2(mask));
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
    scatter(x, -sf2(mask), 100, [0, 0.4470, 0.7410], 'filled')

    % 设置对数坐标轴
    set(gca, 'XScale', 'log', 'YScale', 'log');
    xlim([1e3, 2e5]);
    ylim([3e-3, 1e0]);

    xticks([1e3, 1e4, 1e5]);
    xticklabels({'1', '10', '100'});
    xlabel('[km]', 'FontSize', 24);
    if i == 1
        ylabel('[m^3s^{-3}]', 'FontSize', 24);
    end

    ax.Box = 'on';
    ax.LineWidth = 1;

    % 趋势线
    lin = loglog(logspace(1,6,10), 1e-4*logspace(1,6,10).^(2/3), '--', 'color', [0.5, 0.5, 0.5]);
    lin = loglog(logspace(1,6,10), 1e-9*logspace(1,6,10).^2, '--', 'color', [0.5, 0.5, 0.5]);

    % 注释
    text(2e3, 6e-1, panel_labels{i+4}, 'FontSize', 24);
    text(8e3, 5e-3, 'Irminger Sea', 'FontSize', 16, ...
         'Color', [.5, .5, .5], 'BackgroundColor', 'w');
    text(1500, 2.5e-2, '2/3', 'FontSize', 16, 'Color', [.5, .5, .5]);
    text(2000, 4e-3, '2', 'FontSize', 16, 'Color', [.5, .5, .5]);
    set(ax,'FontSize',16)

end
% 保存图像
filename = './figure/figure5.png';
print('-dpng', '-r600', filename);