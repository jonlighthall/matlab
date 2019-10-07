close all

%% make 10 figures
for i=1:10
    figure()
end

%% example 1. automatically arrange figures.
fprintf('press any key if you want to proceed\n')
pause
autoArrangeFigures(1);

%% make more figures over than the maximum number of figure
% totally 30 figures are now.
fprintf('press any key if you want to proceed\n')
pause
for i=1:20
    figure()
end

%% example 4. I cannot arrange automatically if the number of figures are more than 27.

fprintf('press any key if you want to proceed\n')
pause
autoArrangeFigures(1);
