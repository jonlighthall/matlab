disp(['MATLAB R' version('-release')]);

%% paths
docpath = 'C:\Users\jlighthall\Documents';
fprintf('  docpath: %s is... ',docpath)
if exist(docpath,'dir')~=7
    warning('not found\n');
    return
else
    fprintf('found\n')
    macropath = [docpath '\MATLAB\macros'];
    fprintf('macropath: %s is... ',macropath)
    if exist(macropath,'dir')~=7
        warning('not found\n');
        return
    else
        fprintf('found\n')
        %% paths
        addpath(macropath)
        addpath([macropath '\geo'])
        addpath([macropath '\math'])
        addpath([macropath '\pi'])
        
        %% macros
        load_constants
    end
end

%% settings
matlab.internal.licensing.enableBorrowUI(true)
beep off

%% favorites
% home cd(userpath);
% repos cd(macropath)
