close all

%% make 10 figures
for i=1:10
    figure()
end

%% example 1. automatically arrange figures.
fprintf('press any key to arrange figures\n')
pause
autoArrangeFigures(1);

% make 20 additional figures.
fprintf('press any key to generate additional figures\n')
pause
for i=1:20
    figure()
end

fprintf('press any key to arrange figures\n')
pause
autoArrangeFigures(1);
