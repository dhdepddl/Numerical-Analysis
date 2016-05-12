% generate test matrix A mentioned in problem
n = 30;
B = rand(n);
D = zeros(n);
for i = 1:n
    D(i, i) = i;
end
[Q, R] = qr(B);
A = Q*D*Q';

% lanczos.m 
[a, b, g] = lanczos(A);
disp('eigenvalues of A after n-time iteration');
disp(g);
