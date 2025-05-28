%% plot_energyflux_all_irminger.m
clc; clear; close all

paths = {
    './data/energyflux_irm_spring.mat'
    './data/energyflux_irm_summer.mat'
    './data/energyflux_irm_fall.mat'
};

seasontxt = {'Spring', 'Summer', 'Fall'};

figure
set(gcf, 'Position', [0 50 800 600])
t = tiledlayout(2,3,'TileSpacing','Compact')

for idx = 1:3
    load(paths{idx}, 'energyflux');
    R = 1 ./ energyflux.kf(1:end);
    ax = nexttile(idx);
    plot(R(2:end), energyflux.mean_ebs(2:end-1), 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 3); hold on
    fill([R(2:end), fliplr(R(2:end))], ...
         [.5*energyflux.CI_ebs(1,2:end-1), fliplr(energyflux.CI_ebs(2,2:end-1))], ...
         [0.8500 0.3250 0.0980], 'EdgeAlpha', 0, 'FaceAlpha', 0.3);
    xlog
    set(gca, 'FontSize', 18, 'FontName', 'Times')
    xlim([1e3 1e5]); ylim([0 3e-8])
    ylabel('Injection [m^2s^{-3}]')
    text(1.5e3, 2.5e-8, [sprintf('(%c)', 'a'+idx-1),' ',seasontxt{idx}], 'FontSize', 24)
    %text(1.5e3, 3.5e-8, 'Irminger Sea', 'Color', [.5 .5 .5], 'FontSize', 18, 'FontWeight', 'bold')
    ax.Box = 'on'; ax.LineWidth = 1;

    ax = nexttile(idx+3);
    plot(R, energyflux.mean_SpecFlux(1:end), 'Color', [0.00,0.4471,0.698], 'LineWidth', 3); hold on
    [El, Eu] = spec_error(energyflux.mean_SpecFlux(1:end), 23);
    fill([R, fliplr(R)], [Eu', fliplr(El')], ...
         [0.00, 0.4471, 0.698], 'EdgeAlpha', 0, 'FaceAlpha', 0.3);
    line([1e2 1e6], [0 0], 'LineStyle', '--')
    xlog
    set(gca, 'FontSize', 18, 'FontName', 'Times')
    xlim([1e3 1e5]); ylim([-5e-8 2e-8])
    xlabel('r [km]')
    if idx == 1
        ylabel('Cascade [m^2s^{-3}]')
    end
    text(1.5e3, 1.5e-8, [sprintf('(%c)', 'd'+idx-1),' ',seasontxt{idx}], 'FontSize', 24)
    text(1.5e3, -4e-8, 'Irminger Sea', 'Color', [.5 .5 .5], 'FontSize', 18, 'FontWeight', 'bold')
    ax.Box = 'on'; ax.LineWidth = 1;
end

print('-dpng','-r600','./figure/figure9.png')