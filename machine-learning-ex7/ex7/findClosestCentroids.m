
function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%



% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
% Set K
% [m n] = size(X);
% K = size(centroids, 1);
%for ii = 1:m
%  for kk = 1:K
%    for jj = 1:n
%        result(ii, kk) += (X(ii, jj) - centroids(kk, jj))^2
%    end
%  end
%end

% though bsxfun operates element-byelement, implementation wise it 
% pass vectors into myop assuming myop will vectorize
% the element-wise operation

% thus myop takes in vectors and do element-wise operation
% myop = @(a, b) (a - b) .* (a - b);
% tt = bsxfun(myop, permute(X, [1, 3, 2]), permute(centroids, [3, 1, 2]));
% [tt, idx] = min(sum(tt, 3), [], 2);

% Output index: ii, ll
% X: ii, jj => extended to ii, jj, ll => permuted to ii, ll, jj
% centriods: ll, jj => extended to ll, jj, ii => permuted to ii, ll, jj
% sum on jj dimention (d3)
tt = bsxfun(@minus, permute(X, [1, 3, 2]), permute(centroids, [3, 1, 2]));
[tt, idx] = min(sum(tt .* tt, 3), [], 2);

% =============================================================

end

