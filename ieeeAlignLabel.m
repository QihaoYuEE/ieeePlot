function ieeeAlignLabel(hSubplot)
    [nRows, nCols] = size(hSubplot);
    
    YPosXLabel = zeros(1,nCols);
    XPosYLabel = zeros(1,nRows);
    
    for NumRows = 1:nRows
        for NumCols = 1:nCols
            YPosXLabel(NumCols)= hSubplot(NumRows,NumCols).XLabel.Position(2);
        end
        YPosXLabelMin   = min(YPosXLabel);
        for NumCols = 1:nCols
            hSubplot(NumRows,NumCols).XLabel.Position(2) = YPosXLabelMin;
        end
    end
    
    for NumCols = 1:nCols
        for NumRows = 1:nRows
            XPosYLabel(NumRows)= hSubplot(NumRows,NumCols).YLabel.Position(1);
        end
        XPosYLabelMin   = min(XPosYLabel);
        for NumRows = 1:nRows
            hSubplot(NumRows,NumCols).YLabel.Position(1)= XPosYLabelMin;
        end
    end
end