function [ x, k ] = l_m( initial_guess, error, max_iter )
% implement of levenberg-marquardt method

% initial setting
k=0;                    % k = # iterations
x = initial_guess;      % set initial guess
s = [1; 1];             % set s for start while loop
mu = 0.001;

while norm(s)>error && k<max_iter
    jacobian = @(x, y) [1200*x.^2+(-400*y+2), -400*x; -400*x, 200];
    J = jacobian(x(1), x(2));
    s = -(J'*J+mu*eye(2))\(J'*gradient(x(1), x(2)));
    
    % if mu is small, works like Gauss-Newton method
    % if mu is large, works like Steepest-descent method
    if rosenbrock(x(1)+s(1), x(2)+s(2)) > rosenbrock(x(1), x(2))
        mu = mu*10;
    else
        mu = mu*0.1;
        x = x + s;
    end
    k = k+1;
end
end

