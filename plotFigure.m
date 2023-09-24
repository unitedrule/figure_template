%% Load figure settings
figureSettings;
setFigureSettings;

%% Define plot data
windSpeed = [7.5, 8.0, 8.5, 9.0, 9.5, 10.0, 10.5, 11.0, 11.5, 12.0, 12.5, 13.0, 13.5, 14.0, 14.5, 15.0, 15.5, 16.0, 16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5];
altitude1 = [132.9, 159.9, 192.6, 227.3, 266.8, 308.1, 350.1, 404.2, 478.7, 553.3, 631.4, 717.2, 828.8, 930.0, 992.5, 1088.1, 1144.4, 1190.7, 1249.2, 1303.9, 1354.8, 1395.6, 1432.6, 1470.0, 1503.8]; 

powerDensity = [0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0, 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9, 3.0, 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 4.0, 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7, 4.8, 4.9, 5.0];
altitude2 = [150.0, 207.9, 260.5, 306.9, 361.9, 426.2, 500.6, 546.0, 633.0, 685.2, 765.3, 862.6, 927.1, 972.4, 1028.9, 1083.2, 1117.9, 1144.7, 1175.0, 1194.8, 1225.3, 1253.7, 1282.7, 1307.4, 1336.1, 1353.0, 1374.6, 1389.1, 1404.7, 1419.7, 1438.0, 1450.6, 1465.3, 1477.4, 1489.9, 1498.0, 1507.4, 1527.1, 1547.9, 1564.4, 1606.3, 1638.8, 1651.1, 1665.5, 1679.2, 1695.1, 1731.5, 1717.7];

%% Create new figure
fig = figure; clf

%% Plot first axis
% Create the first axes
ax1 = gca;

% plot data
p1 = plot(ax1, windSpeed , altitude1, ...
         'color', db, ...
         'LineStyle', '-');

% axis limit
xlim(ax1, [5 20])
% ylim(ax1, [0 2000])

% axis scale
ax1.YScale = 'log';

% axis ticks
YTicks = [0, 500, 1000, 1500, 2000];
ax1.YTick = YTicks;

% axis ticks label
ax1.YTickLabel = {'0', '500', '1000', '1500', '2000'};
ax1.FontSize = opts.axesFontSize;

% axis label
xl1 = xlabel(ax1, 'Wind speed (m/s)', ...
            'FontSize', opts.textFontSize);
yl1 = ylabel(ax1, 'Altitude (m)', ...
            'FontSize', opts.textFontSize);

%% Plot second axis
% Create axis
ax2 = axes('Position', ax1.Position,...
           'XAxisLocation','top',...
           'YAxisLocation','right',...
           'Color','none');

% plot data
hold on;
p2 = plot(ax2, powerDensity, altitude2, ...
         'color', dor, ...
         'LineStyle', '--');

% axis limit
xlim(ax2, [0 5.5])
% ylim(ax2, [0 2000])

% axis scale
ax2.YScale = 'log';

% axis ticks
ax2.YTick = YTicks;

% axis ticks label
ax2.YTickLabel = {''};
ax2.FontSize = opts.axesFontSize;

% axis label
xlabel(ax2,'Power density (kW/m$^{2}$)', ...
            'FontSize', opts.textFontSize);
ylabel(ax2,'', ...
      'FontSize', opts.textFontSize);

%% link both axis
% link axis
linkaxes([ax1 ax2], 'y')

% correct relative position
ax2.Position = ax1.Position;

%% define the legened
% set legend
lgnd = legend(ax2, [p1, p2],{'Wind speed (m/s)', 'Power density (kW/m$^{2}$)'}, ...
             'FontSize', opts.legendFontSize, ...
             'Position', opts.legendPsition, ...
             'Orientation', 'horizontal', ...
             'NumColumns', 2, ...
             'box', 'off');

% correct legen position
lgnd.Position(2) = lgnd.Position(2) + opts.legendVerticalOffset;

%% Export the plot
% using export_fig library
% (https://www.mathworks.com/matlabcentral/fileexchange/23629-export_fig)
% (https://github.com/altmany/export_fig)
% export_fig ('wind_power_london', '-pdf', '-r600', '-menubar', '-contextmenu', '-transparent', '-nofontswap', '-painters')

% using standard library
exportgraphics(fig, 'wind_power_london.pdf')

%% Reset Matlab figure settings to default
reset(groot);
