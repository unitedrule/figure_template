%% define figure properties
% define figure colors
cmap = colororder();
db = cmap(1,:); % dark blue
dor = cmap(2,:); % dark orange
lor = cmap(3,:); % light orange
p = cmap(4,:); % purple
gr = cmap(5,:); % green
lb = cmap(6,:); % light blue
dr = cmap(7,:); % dark red

% plot size
opts.figureScaling = 1;
opts.ratioWidthHight = 3;
opts.width = 15.84 * opts.figureScaling;
opts.height = opts.width / opts.ratioWidthHight;
opts.figureUnits = 'centimeters';
opts.figurePaperPositionMode = 'auto';

% plot margins
opts.AxisUnits = 'centimeters';
opts.axisPosition = [0 0 opts.width opts.height];
opts.AxesLooseInset = [0 0 0 0];

% font properties
opts.fontName   = 'Times New Roman';
opts.textFontSize   = 10;
opts.axesFontSize   = 10;
opts.legendFontSize   = 10;
opts.intepreter   = 'latex';

% line properties
opts.LineLineWidth = 1;
opts.AxesLineWidth = 0.25;
opts.MarkerSize = 7.75;
opts.AxesGridLineStyle = ':';
opts.AxesXGrid = 'on';
opts.AxesYGrid = 'on';
opts.AxesZGrid = 'on';
opts.AxesColor = 'k';
opts.AxesTickDir = 'in';

% legend properties
opts.legendVerticalOffset = 0.45;
opts.legendheight = 1;
opts.legendPsition = [0 opts.height+opts.legendVerticalOffset opts.width opts.legendheight];
opts.legendUnits = 'centimeters';