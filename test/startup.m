%% paths
macropath = 'C:\Users\jlighthall\Documents\MATLAB\macros';
if exist(macropath,'dir')~=7
  warning('%s not found\n',macropath);
end

addpath(macropath)
addpath([macropath '\geo'])

%% macros
load_constants

%% favorites
% home cd(userpath);
% repos cd(macropath)
