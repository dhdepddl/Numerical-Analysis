function [ x, k ] = bfgs( initial_guess, error, max_iter )
% implement of bfgs algorithm

% initial setting
k=0;                    % k = # iterations
x = initial_guess;      % set initial guess
B = hessian(x(1), x(2));% initial hessian approximation
epsilon = error;        % set error bound
s = [1; 1];             % set s for start while loop

while norm(s)>epsilon && k < max_iter
    s = -inv(B)*gradient(x(1), x(2)); % compute quasi-newton step
    xp = x;     % x_previous
    x = x+s;    % update solution
    y = gradient(x(1), x(2)) - gradient(xp(1), xp(2));
    B = B + (y*y')/(y'*s) - (B*s*s'*B)/(s'*B*s); % update approximation hessian
    k = k+1;
end
end

