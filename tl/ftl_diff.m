function [tl_diff_1] = ftl_diff(tl1,tl2)
%fTL_diff Trasnmission Loss Weighted Differnce.
%   Calculates the weighting factor for a given transmission loss based on
%   the formulation presented in the following reference. The function
%   parameters are hard-coded based on the values from the given reference.
%
%   The weighted mean absolute error is returm
%
%   https://doi.org/10.23919/OCEANS.2009.5422312
%

% calcuate absolute difference
tl_diff=abs(tl1-tl2);

% calculate weights
tl_weight=tlw(tl1);
sum_weight=sum(tl_weight);

% calculate weighted absolute difference
weighted_diff=tl_diff.*tl_weight;

% calculate weighted mean absolute difference
tl_diff_1=sum(weighted_diff)/sum_weight;

ln=length(tl1);
% fprintf('number of elements = %d \n',ln)
% fprintf('    sum of weights = %.1f \n',sum_weight)
% fprintf('average weight = %f \n',sum_weight/ln)
% 
% fprintf('unweighted MAE = %f\n',mean(tl_diff) )
% fprintf('  weighted MAE = %f\n',tl_diff_1)

end