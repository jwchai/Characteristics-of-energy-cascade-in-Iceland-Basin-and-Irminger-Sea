clear
load ('./data/hydrography.mat')
figure

set(gcf,'Position', [100, 100, 1000, 600]);  % 设置窗口大小
t = tiledlayout(2,1,'TileSpacing','Compact')
nexttile
% 绘制伪彩色等值图
[~, h1] = contourf(lon, -1 * depth, pd', 100, 'LineStyle', 'none');
colormap(othercolor('RdBu5', 30));
colorbar('FontSize', 14, 'Location', 'eastoutside');  % 更优雅的 colorbar

% 设置色标范围
caxis([1031.6 1032.6]);

% 保持当前图像
hold on;

% 设置轴范围和标签
ylim([-600 0]);
xlim([min(lon) max(lon)]);
set(gca, 'FontSize', 16, 'LineWidth', 1.5);

% 横轴：经度使用西经/东经标注（假设lon为负表示西经）
xticks = -50:5:0  % 或用 linspace(min(lon), max(lon), 6)
for i = 1:length(xticks)
xticklabels{i} = [num2str(xticks(i)) '°E'];
end
set(gca, 'XTick', xticks, 'XTickLabel', xticklabels);

% 添加混合层深度线
h1 = line(lon, -1 * mld_mean, 'LineWidth', 3, 'Color', 'k');

% 添加参考线
h2 = line([-30, -30], [-600, 0], 'LineStyle', '--', 'Color', 'k', 'LineWidth', 2);

% 添加文字标签（位置微调）
text(-42, -550, 'Irminger Sea', 'FontSize', 20, 'FontWeight', 'bold');
text(-21, -550, 'Iceland Basin', 'FontSize', 20, 'FontWeight', 'bold');

% 标签和标题（如需要）
xlabel('Longitude', 'FontSize', 18);
ylabel('Depth (m)', 'FontSize', 18);
box on
text(-44,-50,'(a)', 'FontSize', 24)

nexttile
hold on;
h1 = plot(1:12, -1 * mld_monthly_mean1, '-o', 'LineWidth', 3, 'Color', [0 0.447 0.741]);  % 蓝色
h2 = plot(1:12, -1 * mld_monthly_mean2, '--s', 'LineWidth', 3, 'Color', [0.850 0.325 0.098]);  % 橙色
xticks = 1:12;
xticklabels = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
set(gca, 'XTick', xticks, 'XTickLabel', xticklabels);
xlabel('Month', 'FontSize', 18);
ylabel('MLD (m)', 'FontSize', 18);

legend([h1 h2], {'Irminger Sea', 'Iceland Basin'}, 'Location', 'southeast', 'FontSize', 24);
set(gca, 'FontSize', 16, 'LineWidth', 1.55);
grid on;
text(.4,-50,'(b)', 'FontSize', 24)
box on

filename = ['./figure/figure2.png']
print('-dpng','-r300',filename)
