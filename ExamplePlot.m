% Example of ieee plot

%% Example 1: simple figure 1*1
clear all; clc; 
cd;

% Data to plot
x       = 0:1e-3:1;
y1      = sin(2*pi*x);
y2      = cos(2*pi*x);

% Figure size in cm: [Width Height]
% IEEE single column 18.4 cm, double column 8.89*2 + 0.62 cm in between.
FigureSize      = [7.5 5];
% The offset which is desired for subplot distribution: [L B R T].
FigureOffset    = [0 0 0.9 0];
% Plot the figure
hFigure         = ieeeStandardFigureSize(FigureSize,FigureOffset);

% Dimension of the subplot: [Row Column]
SubPlotDim  = [1 1];
% Margin of the subplot in cm (size except the axes): [L B R T].
% To make left and right visually balanced, normally 
% FigureOffset(1) + AxesMargin(1) = FigureOffset(3) + AxesMargin(3)
AxesMargin  = [1 0.72 0.1 0.4];
hSubplot    = ieeeEvenSubplot(SubPlotDim, AxesMargin, FigureSize, FigureOffset);

% Use standard IEEE configuration for the axes
hAxes       = hSubplot;
ieeeStandardAxes(hAxes)

% Plot the figure
hold on
hLine1      = line(x,y1,'LineStyle','-','Color',[153,153,153]/255,'linewidth', 1);
hLine2      = line(x,y2,'LineStyle','-','Color',[0,0,0]/255,'linewidth', 1);
hold off

% Lims, Ticks, and TickLables
hAxes.XLim         = [0 1];
hAxes.YLim         = [-1.1 1.1];
hAxes.XScale       = 'linear';
hAxes.YScale       = 'linear';
hAxes.XTick        = [0 0.5 1];
hAxes.YTick        = [-1 0 1];
hAxes.XTickLabel   = {'0','$\frac{1}{2}T_{o}$','$T_{o}$'};
% Title
hTitle      = title('$\sin\left(\omega t\right)$ and $\cos\left(\omega t\right)$');
% Label
hXLabel     = xlabel('Time $t$ (s)');
hYLabel     = ylabel('Magnitude');

% Add the legend
hLegend     = legend([hLine1,hLine2],'$\sin\left(\omega t\right)$','$\cos\left(\omega t\right)$',...
    'Interpreter','latex');
hLegend.FontName    = 'Times New Roman';
hLegend.FontSize    = 8;

% Adjust the legend to the corner
ieeeAxesLegend(hLegend,hAxes,'Northeast')

% Export as pdf
ieeeExportPDF('PlotPDF','Example1.pdf')



%% Example 2: subplot 2*2, distributed equally;
clear all; clc; 
cd;

% Data to plot
x       = 0:1e-3:1;
y1      = sin(2*pi*x);
y2      = 10*cos(2*pi*x);

% Figure size in cm: [Width Height]
% IEEE single column 18.4 cm, double column 8.89*2 + 0.62 cm in between.
FigureSize      = [7.5 5];
% The offset which is desired for subplot distribution: [L B R T].
FigureOffset    = [0 0.62 0.9 0.3];
% Plot the figure
hFigure         = ieeeStandardFigureSize(FigureSize,FigureOffset);

% Dimension of the subplot: [Row Column]
SubPlotDim  = [2 2];
% Margin of the subplot in cm (size except the axes): [L B R T].
% To make left and right visually balanced, normally 
% FigureOffset(1) + AxesMargin(1) = FigureOffset(3) + AxesMargin(3)
AxesMargin  = [1 0.1 0.1 0.1];
hSubplot    = ieeeEvenSubplot(SubPlotDim, AxesMargin, FigureSize, FigureOffset);

for ncol = 1:SubPlotDim(2)
    for nrow = 1:SubPlotDim(1)
        hAxes       = hSubplot(nrow,ncol);
        
        % Use standard IEEE configuration for the axes
        ieeeStandardAxes(hAxes)

        axes(hAxes)
        % Plot the figure
        if nrow == 1
            % Lims, Ticks, and TickLables
            hAxes.XLim         = [0 1];
            hAxes.XScale       = 'linear';
            hAxes.XTick        = [0 0.5 1];
            hAxes.XTickLabel   = {};
            hAxes.YLim         = [-1.1 1.1];
            hAxes.YTick        = [-1 0 1];
            hAxes.YScale       = 'linear';
            %         hAxes.YTickLabel   = {'0','$\frac{1}{2}T_{o}$','$T_{o}$'};
            
            hLine1      = line(x,y1,'LineStyle','-','Color',[153,153,153]/255,'linewidth', 1);
            hLegend     = legend(hLine1,'$\sin\left(\omega t\right)$',...
            'Interpreter','latex');
        elseif nrow == 2
            % Lims, Ticks, and TickLables
            hAxes.XLim         = [0 1];
            hAxes.XScale       = 'linear';
            hAxes.XTick        = [0 0.5 1];
            hAxes.XTickLabel   = {'0','$\frac{1}{2}T_{o}$','$T_{o}$'};
            
            hLine1      = line(x,y2,'LineStyle','-','Color',[0,0,0]/255,'linewidth', 1);
            hXLabel     = xlabel('Time $t$ (s)');
            hLegend     = legend(hLine1,'$\cos\left(\omega t\right)$',...
            'Interpreter','latex');
            hAxes.YLim         = [-11 11];
            hAxes.YTick        = [-10 0 10];
        else
        end
        
        hYLabel     = ylabel('Magnitude');
        hLegend.FontName    = 'Times New Roman';
        hLegend.FontSize    = 8;
        
        % Adjust the legend to the corner
        ieeeAxesLegend(hLegend,hAxes,'Northeast')
    end
end

ieeeAlignLabel(hSubplot)
% Export as pdf
ieeeExportPDF('PlotPDF','Example2.pdf')

%% Example 2: subplot 2*3, distributed oddly;
clear all; clc; 
cd;

% Data to plot
x       = 0:1e-3:1;
y1      = sin(2*pi*x);
y2      = 10*cos(2*pi*x);

% Figure size in cm: [Width Height]
% IEEE single column 18.4 cm, double column 8.89*2 + 0.62 cm in between.
FigureSize      = [16 6];
% The offset which is desired for subplot distribution: [L B R T].
FigureOffset    = [0 1.32 0.9 0.1];
% Plot the figure
hFigure         = ieeeStandardFigureSize(FigureSize,FigureOffset);

% Dimension of the subplot: [Row Column]
SubPlotDim  = [2 3];
% Margin of the subplot in cm (size except the axes): [L B R T].
% To make left and right visually balanced, normally 
% FigureOffset(1) + AxesMargin(1) = FigureOffset(3) + AxesMargin(3)
AxesMargin  = [1 0.1 0.1 0.6];
RowRatio    = [1 0.8 1.2];
ColRatio    = [1.2 0.8];
hSubplot    = ieeeOddSubplot(SubPlotDim,RowRatio,ColRatio, AxesMargin, FigureSize, FigureOffset);

for ncol = 1:SubPlotDim(2)
    for nrow = 1:SubPlotDim(1)
        hAxes       = hSubplot(nrow,ncol);
        
        % Use standard IEEE configuration for the axes
        ieeeStandardAxes(hAxes)

        axes(hAxes)
        % Plot the figure
        if nrow == 1
            % Lims, Ticks, and TickLables
            hAxes.XLim         = [0 1];
            hAxes.XScale       = 'linear';
            hAxes.XTick        = [0 0.5 1];
            hAxes.XTickLabel   = {};
            hAxes.YLim         = [-1.1 1.1];
            hAxes.YTick        = [-1 0 1];
            hAxes.YScale       = 'linear';
            %         hAxes.YTickLabel   = {'0','$\frac{1}{2}T_{o}$','$T_{o}$'};
            
            hLine1      = line(x,y1,'LineStyle','-','Color',[153,153,153]/255,'linewidth', 1);
            hLegend     = legend(hLine1,'$\sin\left(\omega t\right)$',...
            'Interpreter','latex');
        elseif nrow == 2
            % Lims, Ticks, and TickLables
            hAxes.XLim         = [0 1];
            hAxes.XScale       = 'linear';
            hAxes.XTick        = [0 0.5 1];
            hAxes.XTickLabel   = {'0','$\frac{1}{2}T_{o}$','$T_{o}$'};
            
            hLine1      = line(x,y2,'LineStyle','-','Color',[0,0,0]/255,'linewidth', 1);
            hXLabel     = xlabel('Time $t$ (s)');
            hLegend     = legend(hLine1,'$\cos\left(\omega t\right)$',...
            'Interpreter','latex');
            hAxes.YLim         = [-11 11];
            hAxes.YTick        = [-10 0 10];            
        end
        
        hYLabel     = ylabel('Magnitude');
        hLegend.FontName    = 'Times New Roman';
        hLegend.FontSize    = 8;
        
        % Adjust the legend to the corner
        ieeeAxesLegend(hLegend,hAxes,'Northeast')
        ieeeOuterLegend(hLegend,hSubplot(nrow,:),'Top',0.1)
    end
end
ieeeFigureCaption(hSubplot,'bottom')
ieeeAlignLabel(hSubplot)
% Export as pdf
ieeeExportPDF('PlotPDF','Example3.pdf')