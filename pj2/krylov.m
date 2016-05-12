function [ K, c ] = krylov( A )
n = length(A);
% initial vector
x = ones(n, 1)*100;
K = zeros(n, n);
for i = 1:n
    K(:,i) = x;
    x = A*x;
end
c = K\(-x);
c = cat(1, c, 1);
c = flip(c);
end