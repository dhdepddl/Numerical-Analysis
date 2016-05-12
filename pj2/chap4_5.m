A = [9 4.5 3; -56 -28 -18; 60 30 19];

%(a)
e = eig(A);
disp('4.5(a):');
disp(e);

%(b)
A1 = [9 4.5 3; -56 -28 -18; 60 30 18.95];
disp('4.5(b):');
e = eig(A1);
disp(e);
disp('The changes in magnitudes of the eigenvalues is large');
disp('relative to changes in the magnitudes of the coefficient');
disp(' ');

%(c)
A2 = [9 4.5 3; -56 -28 -18; 60 30 19.05];
disp('4.5(c):');
e = eig(A2);
disp(e);
disp('The changes in magnitudes of the eigenvalues is large');
disp('relative to changes in the magnitudes of the coefficient');
disp(' ');

%(d)
disp('4.5(d)');
disp('condition number of given matrix A:');
disp(cond(A));
disp('A is ill-conditioned matrix which means that');
disp('small changes in the constant coefficients results in a large change in the solution.');
disp('We can measure the degree of ill-conditioning by its condition number');
disp('Larger condition number a matrix has, the matrix is more ill-conditioned and');
disp('closer to 1 condition number a matrix has, the matrix is well-conditioned');