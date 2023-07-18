function [weight] = tlw(TL)
%TLW Trasnmission Loss Weight.
%   Calculates the weighting factor for a given transmission loss based on
%   the formulation presented in the following reference. The function
%   parameters are hard-coded based on the values from the given reference.
%
%   https://doi.org/10.23919/OCEANS.2009.5422312
%
%   Return values are are in the range [0,1].

% assign weighting parameters
wTL_min=60;
wTL_max=110;
wTL_span=wTL_max-wTL_min;

% calculate weight
weight = (wTL_max-TL)/wTL_span;

% restrict weight to [0,1]
weight = min(weight,1);
weight = max(weight,0);
end