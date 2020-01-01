function hSubPlot = ieeeEvenSubplot(Dimension, AxesMargin, FigureSize, FigureOffset)

% Number of rows and columns of axess
nrows       = Dimension(1);
ncols       = Dimension(2);
hSubPlot    = gobjects(nrows,ncols);

% Get the dimension of the subplot (each axes)
% Margin of each axes (in cm): Font 8 heigh = 0.28 cm;
MarginL     = AxesMargin(1);
MarginB     = AxesMargin(2);
MarginR     = AxesMargin(3);
MarginT     = AxesMargin(4);

FigWidth    = FigureSize(1);
FigHeight   = FigureSize(2);

% Offset of the dimension which not distributed evenly
OffsetL     = FigureOffset(1);
OffsetB     = FigureOffset(2);
OffsetR     = FigureOffset(3);
OffsetT     = FigureOffset(4);

% SubPlotW and SubPlotH are the outer dimension of each axes
SubPlotW    = FigWidth/ncols;
SubPlotH    = FigHeight/nrows;

% AxesW and AxesH are the inner dimension of each axes
AxesW       = SubPlotW - MarginL - MarginR;
AxesH       = SubPlotH - MarginB - MarginT;
for NumCols     = 1:ncols
    for NumRows     = 1:nrows
        hSubPlot(NumRows,NumCols)    = subplot(nrows,ncols,NumCols+(NumRows-1)*ncols);
        % Evenly distribute the width and height of all axes. The width of
        % ylabel and ytick and the heigh of xlabel and xtick should be considered.
        hSubPlot(NumRows,NumCols).Units        = 'centimeters';
        hSubPlot(NumRows,NumCols).Position     = [(NumCols-1)*SubPlotW + MarginL + OffsetL ...
            (nrows-NumRows)*SubPlotH + MarginB + OffsetB AxesW AxesH];
    end
end

end
