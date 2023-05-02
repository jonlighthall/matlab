function [outputArg1] = my_mse(A,B,w,do_print)
%UNTITLED Weighted Mean-Squared Error.
%   Detailed explanation goes here
%
%   See also IMMSE
if nargin<4
    do_print=false;
end

if isequal(size(A),size(B))
    num_el=numel(A);
    if do_print
        fprintf('each array has %d number of elements: %d x %d \n',num_el,size(A))
    end
else

    error(message('images:validate:unequalSizeMatrices','A','B'));
end

if nargin < 3
    w=ones(size(A));
    if do_print
        fprintf('using uniform weighting\n')
    end
else
    if do_print
        fprintf('using user-specified weighting\n')
    end
    if ~isequal(size(A),size(w))
        error(message('images:validate:unequalSizeMatrices','A','w'));
    end
end
Sum_weight=sum(w(:));
if do_print
    fprintf('The sum of weights = %f\n',Sum_weight);
    fprintf('The average element weight is %f\n',Sum_weight/num_el)
end

my_error_mat=A-B;
my_error_arr=A(:)-B(:);

my_sqerr_mat=my_error_mat.^2;
my_sqerr_arr=my_error_arr.^2;

my_weighted_sqerr_mat=my_sqerr_mat.*w;
my_weighted_sqerr_arr=my_sqerr_arr.*w(:);

my_sum_wt_sqerr_mat=sum(my_weighted_sqerr_mat,'all');
my_sum_wt_sqerr_arr=sum(my_weighted_sqerr_arr);

my_wt_mse_mat=my_sum_wt_sqerr_mat/Sum_weight;
my_wt_mse_arr=my_sum_wt_sqerr_arr/Sum_weight;

my_wt_rmse_mat=sqrt(my_wt_mse_mat);
my_wt_rmse_arr=sqrt(my_wt_mse_arr);

if my_wt_rmse_mat==my_wt_rmse_arr
    if do_print
        fprintf('array and matrix methods agree\n')
    end
else
    warning('array and matrix methods DO NOT agree\n')
end

mse=immse(A,B);
if do_print
    fprintf('=========================\n')
    fprintf('unweighted  MSE = %7.4f\n',mse)
    fprintf('unweighted RMSE = %7.4f\n',sqrt(mse))
    fprintf('-------------------------\n')
    fprintf('  weighted  MSE = %7.4f\n',my_wt_mse_mat)
    fprintf('  weighted RMSE = %7.4f\n',my_wt_rmse_mat)
    fprintf('=========================\n')
end
outputArg1=my_wt_mse_mat;

%outputArg1=sum( (A(:)-B(:)).^2  ) /Sw;

%outputArg1=(sum( abs(A(:)-B(:)).^2  * w ) ) /Sw;

%outputArg1=sum((A(:)-B(:)).^2)/numel(A);
%outputArg1=(norm(A(:)-B(:),2).^2)/numel(A); % as defined in immse

%outputArg1=(norm((A(:)-B(:)).*w(:),2).^2) / Sw;
end