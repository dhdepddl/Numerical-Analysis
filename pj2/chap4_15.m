% generate random matrix A
n = 10;
A = rand(n, n);

% krylov.m
[K, c] = krylov(A);

disp('Accuracy of krylov method');
disp('eigenvalues of A computed by krylov method and roots');
disp(roots(c));
disp('eigenvalues of A computed by eig function');
disp(eig(A));
disp('The result is different to initial vector.');
disp('krylov method is fit to less or equal 10 by 10 matrix,');
disp('but it is not accurate if the matrix is large.');
disp('Also, it is not good to badly scaled matrix.');
disp(' ');

disp('Efficiency of krylov method');
f = @() eig(A);
t1 = timeit(f);
f = @() roots(c);
f2 = @() krylov(A);
t2 = timeit(f) + timeit(f2);
disp('running time for compute eigenvalues of A by using eig');
disp(t1);
disp('running time for compute eigenvalues of A by using krylov method and roots');
disp(t2);
disp('using eig function is more efficient about 2~20 times');
