function [my_wt_mse,my_weighted_rt_sq_err] = my_mse(A,B,w,do_print)
%MY_MSE Weighted Mean-Squared Error.
%   Detailed explanation goes here
%
%   See also IMMSE

%   Mar 2023 JCL

%% parse input arguments
% default print setting
if nargin<4
    do_print=false;
end

% check input size
if isequal(size(A),size(B))
    num_el=numel(A);
    if do_print
        fprintf('each input has %d number of elements: %d x %d \n',num_el,size(A))
    end
else
    error(message('images:validate:unequalSizeMatrices','A','B'));
end

% defaults to standard, un-weighted MSE if no weight is given
if nargin < 3
    w=ones(size(A));
    if do_print
        fprintf('using uniform weighting\n')
    end
else
    if do_print
        fprintf('using user-specified weighting\n')
    end
    % check input size
    if ~isequal(size(A),size(w))
        error(message('images:validate:unequalSizeMatrices','A','w'));
    end
end

%% calculate weighted squared error
my_error=A-B;
% normally, the MATLAB function sumsqr() could be use, but each squared
% error must be individually weighted
my_sqerr=my_error.^2;
my_weighted_sq_err=my_sqerr.*w;
my_weighted_rt_sq_err=sqrt(my_sqerr).*w;

my_weighted_sumsq_err=sum(my_weighted_sq_err,'all');

%% calculate mean weighted squared error
sum_weight=sum(w(:));
if do_print
    fprintf('The sum of weights = %f\n',sum_weight);
    fprintf('The average element weight is %f\n',sum_weight/num_el)
end
my_wt_mse=my_weighted_sumsq_err/sum_weight;
my_wt_rmse=sqrt(my_wt_mse);

mse=immse(A,B);
if do_print
    fprintf('=========================\n')
    fprintf('unweighted  MSE = %7.4f\n',mse)
    fprintf('unweighted RMSE = %7.4f\n',sqrt(mse))
    fprintf('-------------------------\n')
    fprintf('  weighted  MSE = %7.4f\n',my_wt_mse)
    fprintf('  weighted RMSE = %7.4f\n',my_wt_rmse)
    fprintf('=========================\n')
end
end