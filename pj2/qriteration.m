function [ x, A, count ] = qriteration( A )
% QR iteration with shift to compute eigenvalue of a matrix
n = length(A);
fac = nondiag(A)/(n-1)/diagsum(A);
count = 0;

% prevent infinite loop, check also count is less than 100
while (0.1<fac) && (count<500)
    % use corner entry as shift
    s = A(n, n);
    A = A - s*eye(n);
    % compute QR factorization QR = A - sigma*I
    [Q, R] = qr(A);
    A = R*Q + s*eye(n);
    % use variable 'fac' is less than 0.1
    % to check non-diagonal entries convergence zero
    % which represent fraction of mean of non-diagonal entries
    % and diagonal entries
    fac = nondiag(A)/(n-1)/diagsum(A);
    count = count + 1;
end
% if fac is larger or equal than 1,
% it means that the non-diagonal entries does not converge to zero
% so throw 'does not converge' error
if fac >= 1
    error('does not converge. Use other method.');
end
x = diag(A);
end

