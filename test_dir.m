function [stat]=test_dir(dir_in)
fprintf('%9s: %s is... ',inputname(1),dir_in)
stat=exist(dir_in,'dir');
if stat~=7
    fprintf('not found\n ');
    warning('''%s'' not found',dir_in);
    return
else
    fprintf('found\n')
end
end