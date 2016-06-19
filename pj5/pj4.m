% set grid and graph
x = linspace(-2, 2, 50);
y = linspace(-2, 2, 50);
[x, y] = meshgrid(x, y);

figure(1);
hold on;
subplot(2, 1, 1);
surf(x, y, rosenbrock(x, y));
title('Rosenbrock func 3-dim');

subplot(2, 1, 2);
contourf(x, y, rosenbrock(x, y), 50);
colorbar;
title('Rosenbrock func 2-dim');


a = [-2; -2];
disp('(a) steepest descent method');
[result, k] = steepest(a, 1e-10, 10000);
disp('minimizer x: '); disp(result);
disp('number of iteration: '); disp(k);

disp('(b) newton method');
[result, k] = newton(a, 1e-10, 10000);
disp('minimizer x: '); disp(result);
disp('number of iteration: '); disp(k);

disp('(c) bfgs method');
[result, k] = bfgs(a, 1e-10, 10000);
disp('minimizer x: '); disp(result);
disp('number of iteration: '); disp(k);

disp('(d) Levenberg-Marquardt method');
[result, k] = l_m(a, 1e-10, 10000);
disp('minimizer x: '); disp(result);
disp('number of iteration: '); disp(k);