function ieeeAxesLegend(hLegend,hAxes,Position)

% Adjust legend position
hLegend.Units       = 'centimeters';
hLegendL            = hLegend.Position(1);
hLegendB            = hLegend.Position(2);
hLegendW            = hLegend.Position(3);
hLegendH            = hLegend.Position(4);

switch Position
    case {'northwest' , 'Northwest' , 'NorthWest'}
        hLegendL            = hAxes.Position(1);
        hLegendB            = hAxes.Position(2) + hAxes.Position(4) - hLegendH;
    case {'northeast' , 'Northeast' , 'NorthEast'}
        hLegendL            = hAxes.Position(1) + hAxes.Position(3) - hLegendW;
        hLegendB            = hAxes.Position(2) + hAxes.Position(4) - hLegendH;
    case {'southeast' , 'Southeast' , 'SouthEast'}
        hLegendL            = hAxes.Position(1) + hAxes.Position(3) - hLegendW;
        hLegendB            = hAxes.Position(2);
    case {'southwest' , 'Southwest' , 'SouthWest'}
        hLegendL            = hAxes.Position(1);
        hLegendB            = hAxes.Position(2);
    case {'north' , 'North'}
        hLegendL            = hAxes.Position(1) + hAxes.Position(3)/2 - hLegendW/2;
        hLegendB            = hAxes.Position(2) + hAxes.Position(4) - hLegendH;
    case {'south' , 'South'}
        hLegendL            = hAxes.Position(1) + hAxes.Position(3)/2 - hLegendW/2;
        hLegendB            = hAxes.Position(2);
    case {'west' , 'West'}
        hLegendL            = hAxes.Position(1);
        hLegendB            = hAxes.Position(2) + hAxes.Position(4)/2 - hLegendH/2;
    case {'east' , 'East'}
        hLegendL            = hAxes.Position(1) + hAxes.Position(3) - hLegendW;
        hLegendB            = hAxes.Position(2) + hAxes.Position(4)/2 - hLegendH/2;
    otherwise
        warning('Corner is not found. The legend adjust failed.')
end

hLegend.Position    = [hLegendL,hLegendB,hLegendW,hLegendH];

end