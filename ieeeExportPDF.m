function ieeeExportPDF(Dir,Name)

% make a new folder if it doesn't exist
if ~exist(Dir, 'dir')
    mkdir(Dir)
end

OldDir = cd;
cd(Dir)
print(Name,'-dpdf')
% print -dpdf Name
cd(OldDir)

end