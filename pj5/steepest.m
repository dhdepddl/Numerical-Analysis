function [ x, k ] = steepest( initial_guess, error, max_iter )
% implement of steepest algorithm

% initial setting
k=0;                    % k = # iterations
x = initial_guess;      % set initial guess
epsilon = error;        % set error bound
s = -gradient(x(1), x(2));   % steepest descent direction
a = 0.9;                % set interation parameter

% Begin method
while  norm(a*s) > epsilon && k < max_iter                    
    s = -gradient(x(1), x(2));  % compute negative gradient
    minfun = @(a)rosenbrock(x(1) + a*s(1), x(2)+a*s(2));
    a = fminbnd(minfun, 0, 1);  % perform line search
    x = x + a*s;        % update solution
    k = k + 1;          % increase interation
end
end

