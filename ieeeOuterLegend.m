function ieeeOuterLegend(hLegend,Subplot,Position,Margin)

% Adjust legend position
hLegend.Units       = 'centimeters';
hLegendL            = hLegend.Position(1);
hLegendB            = hLegend.Position(2);
hLegendW            = hLegend.Position(3);
hLegendH            = hLegend.Position(4);

SubplotDim          = size(Subplot);
LeftPosition        = zeros(SubplotDim);
RightPosition       = zeros(SubplotDim);
BottomPosition      = zeros(SubplotDim);
TopPosition         = zeros(SubplotDim);

for i = 1:SubplotDim(1)
    for j = 1:SubplotDim(2)
        hAxes       = Subplot(i,j);
        LeftPosition(i,j)   = hAxes.Position(1);
        RightPosition(i,j)  = hAxes.Position(1) + hAxes.Position(3);
        BottomPosition(i,j) = hAxes.Position(2);
        TopPosition(i,j)    = hAxes.Position(2) + hAxes.Position(4);
    end
end
MostLeft            = min(reshape(LeftPosition,1,[]));
MostRight           = max(reshape(RightPosition,1,[]));
MostBottom          = min(reshape(BottomPosition,1,[]));
MostTop             = max(reshape(TopPosition,1,[]));

switch Position
    case {'top' , 'Top', 'north' , 'North'}
        hLegendL            = MostLeft + ((MostRight - MostLeft) - hLegendW)/2;
        hLegendB            = MostTop + Margin;
    case {'right' , 'Right', 'east' , 'East'}
        hLegendL            = MostRight + Margin;
        hLegendB            = MostBottom + (MostTop - MostBottom - hLegendH)/2;
    otherwise
        warning('Position is not found. The legend adjust failed.')
end

hLegend.Position    = [hLegendL,hLegendB,hLegendW,hLegendH];

end