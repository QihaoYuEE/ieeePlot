function ieeeFigureCaption(hSubplot,Option)

CapASCII        = 96;       % an ASCII code before lowercase a
SubPlotDim      = size(hSubplot);

switch Option
    case {'All' , 'all'}
        for i = 1:SubPlotDim(1)
            for j = 1:SubPlotDim(2)
                hAxes       = hSubplot(i,j);
                axes(hAxes)
                CapASCII    = CapASCII + 1;
                CapTotal    = [40 CapASCII 41];         % 40, 41 are the bracket
                hCaption    = text(0,0,(char(CapTotal)));       % The text position is relative to the axes
                hCaption.Units      = 'centimeters';
                x           = (hAxes.Position(3))/2;     % 0.36 here is an approximation of the width of (a)
                % Adjust caption y position according to whether there are
                % XTickLabel and XLabel or not
                y           = -0.5;
                if isempty(hAxes.XTickLabel)
                else
                    y       = y - 0.3;
                end
                if isempty(hAxes.XLabel.Text.String)
                else
                    y       = y - 0.3;
                end
                hCaption.Position   = [x y];
                hCaption.HorizontalAlignment    = 'Center';
                hCaption.FontName   = 'Times New Roman';
                hCaption.FontSize   = 8;
                hCaption.Interpreter = 'latex';
            end
        end
    case {'Bottom' , 'bottom'}
            for j = 1:SubPlotDim(2)
                hAxes       = hSubplot(SubPlotDim(1),j);
                axes(hAxes)
                CapASCII    = CapASCII + 1;
                CapTotal    = [40 CapASCII 41];         % 40, 41 are the bracket
                hCaption    = text(0,0,(char(CapTotal)));       % The text position is relative to the axes
                hCaption.Units      = 'centimeters';
                x           = (hAxes.Position(3))/2;     % 0.36 here is an approximation of the width of (a)
                % Adjust caption y position according to whether there are
                % XTickLabel and XLabel or not
                y           = -0.5;
                if isempty(hAxes.XTickLabel)
                else
                    y       = y - 0.3;
                end
                if isempty(hAxes.XLabel.Text.String)
                else
                    y       = y - 0.3;
                end
                hCaption.Position   = [x y];
                hCaption.HorizontalAlignment    = 'Center';
                hCaption.FontName   = 'Times New Roman';
                hCaption.FontSize   = 8;
                hCaption.Interpreter = 'latex';
            end
    otherwise
        warning('Corner is not found. The legend adjust failed.')
end

end