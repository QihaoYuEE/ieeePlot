function hFigure = ieeeStandardFigureSize(FigureSize,FigureOffset)

% Figure dimensions in cm,
% IEEE single column 18.4 cm, double column 8.89*2 + 0.62 cm in between.
% The best ratio of width to height: 0.618
FigWidth        = FigureSize(1);
FigHeight       = FigureSize(2);

hFigure         = figure;
clf();      % clear figure

% Offset of the dimension which not distributed evenly
OffsetL         = FigureOffset(1);
OffsetB         = FigureOffset(2);
OffsetR         = FigureOffset(3);
OffsetT         = FigureOffset(4);

FigWidthReal    = FigWidth + OffsetL + OffsetR;
FigHeightReal   = FigHeight + OffsetB + OffsetT;

hFigure.PaperUnits  = 'centimeters';
hFigure.PaperSize   = [FigWidthReal, FigHeightReal];
hFigure.PaperPositionMode   = 'manual';
hFigure.PaperPosition = [0, 0, FigWidthReal, FigHeightReal];

% Optionally move figure in window, Position -- [left bottom width height]
% Meanwhile set window size to aforementioned dimension.
set(hFigure,'Units','centimeters');
set(hFigure,'Position', [15, 15, FigWidthReal, FigHeightReal]);     % 15 and 15 cm to monitor left and bottom

% Set the axes outer position, OuterPosition -- [left bottom width height]
% The default unit is 'normalized'
set(gca,'Units','centimeters');
set(gca,'OuterPosition', [0, 0, FigWidthReal, FigHeightReal]);

end
