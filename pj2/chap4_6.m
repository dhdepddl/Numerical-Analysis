% qriteration.m
disp('matrix in exercise 4.2: ')
A = [2 3 2; 10 3 4; 3 6 1];
disp(A);
disp('eigenvalues of the matrix by computed using eig function')
disp(eig(A));
disp('eigenvalues of the matrix by computed using qriteraion function')
[x] = qriteration(A);
disp(x);

disp('matrix in exercise 4.1(a): ');
A = [1 1000; 0.001 1];
disp(A)
disp('eigenvalues of the matrix by computed using eig function')
disp(eig(A));
disp('eigenvalues of the matrix by computed using qriteraion function')
[x] = qriteration(A);
disp(x);
