function [tl_diff_1] = ftl_diff(tl1,tl2,print_stat)
%ftl_diff - Weighted Transmission Loss difference
%   Calculates the weighted Mean Absolute Error between two transmission loss
%   curves based on the formulation presented in the following reference.
%   Returns the quantity "TL_1^diff" from reference.
%
%   https://doi.org/10.23919/OCEANS.2009.5422312
%

% check for NaN values and enter debug mode if found
if any(isnan(tl1(:)))
    warning('NaN values detected in tl1 array.');
    nan_indices = find(isnan(tl1));

    if isempty(nan_indices)
        fprintf('No NaN values found in tl1 array.\n');
    else
        fprintf('NaN values found at indices: %s\n', num2str(nan_indices));
    end

    if any(nan_indices ~= 1 & nan_indices ~= numel(tl1))
        warning('NaN detected at a location other than the start or end of tl1 array.');
    else
        if any(nan_indices == 1)
            fprintf('NaN detected at the start of tl1 array.\n');
        end
        if any(nan_indices == numel(tl1))
            fprintf('NaN detected at the end of tl1 array.\n');
        end
    end

end
if any(isnan(tl2(:)))
    warning('NaN values detected in tl2 array.');
    nan_indices = find(isnan(tl2));
    if isempty(nan_indices)
        fprintf('No NaN values found in tl2 array.\n');
    else
        fprintf('NaN values found at indices: %s\n', num2str(nan_indices));
    end
    if any(nan_indices ~= 1 & nan_indices ~= numel(tl2))
        warning('NaN detected at a location other than the start or end of tl2 array.');
    else
        if any(nan_indices == 1)
            fprintf('NaN detected at the start of tl2 array.\n');
        end
        if any(nan_indices == numel(tl2))
            fprintf('NaN detected at the end of tl2 array.\n');
        end
    end

end

if any(isnan(tl1(:))) || any(isnan(tl2(:)))
    fprintf('Removing NaN values before proceeding...\n');
    ni=length(tl1);
    % Remove NaN values from tl1 and tl2
    nan_mask = ~isnan(tl1) & ~isnan(tl2);
    tl1 = tl1(nan_mask);
    tl2 = tl2(nan_mask);

    nf = length(tl1);
    if nf ~= ni
        nr=ni-nf;
        fprintf('Original length: %d, New length: %d, Removed elements: %d\n', ni, nf, nr);
    end
end

% calculate absolute difference
tl_diff=abs(tl1-tl2);

if any(isnan(tl_diff(:)))
    warning('NaN values detected in tl_diff array after absolute difference calculation.');
    fprintf('Note to developer: fix something in tl_diff calculation!\n');
    keyboard;
end

% calculate weights
if exist('tlw', 'file') == 2
    tl_weight = tlw(tl1);
else
    error('The function tlw is not defined or not on the MATLAB path. Please define tlw.m or add it to the path.');
end
if any(isnan(tl_weight(:)))
    warning('NaN values detected in tl_weight array after weight calculation.');
    fprintf('Note to developer: fix something in tl_weight calculation!\n');
    keyboard;
end

sum_weight=sum(tl_weight);
if isnan(sum_weight) || abs(sum_weight) < eps
    fprintf('Note to developer: fix something in sum_weight calculation!\n');
    error('Sum of weights is NaN or zero, cannot compute weighted mean absolute difference.');
end

% calculate weighted absolute difference
weighted_diff = tl_diff .* tl_weight;

if any(isnan(weighted_diff(:)))
    warning('NaN values detected in weighted_diff array after multiplication.');
    fprintf('Note to developer: fix something in weighted_diff calculation!\n');
    keyboard;
end

% calculate weighted mean absolute difference
% this output is the TL_1^diff from the reference
tl_diff_1 = sum(weighted_diff) / sum_weight;

if any(isnan(tl_diff_1))
    fprintf('Note to developer: fix something in tl_diff_1 calculation!\n');
    error('NaN value detected in tl_diff_1 after weighted mean absolute difference calculation.');
end

% print statistics
if nargin < 3
    % set default value
    print_stat=false;
end

if print_stat
    ln=length(tl1);
    fprintf('number of elements = %d \n',ln)
    fprintf('    sum of weights = %.1f \n',sum_weight)
    if ln > 0
        fprintf('average weight = %f \n',sum_weight/ln)

        fprintf('unweighted MAE = %f\n',mean(tl_diff) )
        fprintf('  weighted MAE = %f\n',tl_diff_1)
    end
    fprintf('unweighted MAE = %f\n',mean(tl_diff) )
    fprintf('  weighted MAE = %f\n',tl_diff_1)
end
end