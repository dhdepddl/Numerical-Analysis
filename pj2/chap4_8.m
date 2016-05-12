disp('4.8');
disp('companion matrix C:');
C = [0 0 0 -24; 1 0 0 40; 0 1 0 -35; 0 0 1 13];
disp(C);

e = eig(C);
disp('eigenvalues of C computed by using library routine "eig":');
disp(e);

disp('roots of polynomials by using "roots"');
p = [1 -13 35 -40 24];
r = roots(p);
disp(r);



p1 = [1 3.3 -52 93 -4 0.5 -108 -1.2 2 0 101 -98 -7.35 30 -2 17 8 63 -0.29 50];
C1=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -50;
    1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.29;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -63;
    0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -8;
    0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -17;
    0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 2;
    0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 -30;
    0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 7.35;
    0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 98;
    0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 -101;
    0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 -2;
    0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1.2;
    0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 108;
    0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 -0.5;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 4;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -93;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 52;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -3.3];
e1 = eig(C1);
r1 = roots(p1);
disp(e1);
disp(r1);

f = @() eig(C1);
t1 = timeit(f);
f = @() roots(p1);
t2 = timeit(f);
disp('running time for eig(C1)');
disp(t1);
disp('running time for roots(p1)');
disp(t2);

%you can change n which is the size of matrix
n = 50;
p2 = rand(1, n+1)*100;
p2(1, 1) = 1;

C2 = cat(2, cat(1, zeros(1, n-1), eye(n-1)), -flipud(transpose(p2(2:n+1))));
f = @() eig(C2);
t1 = timeit(f);
f = @() roots(p2);
t2 = timeit(f);
disp('for given size of matrix companion matrix or degree of polynomial: ');
disp(n);
disp('running time for eig(C2)');
disp(t1);
disp('running time for roots(p2)');
disp(t2);

disp('As a result to run this code with changing the size of companion matrix,');
disp('computing the solution with companion matrix is faster than using roots function in the majority of cases');