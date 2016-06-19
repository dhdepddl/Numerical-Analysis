function [ x, k ] = newton( initial_guess, error, max_iter )
% implement of newton method

% initial setting
k=0;                % k = # iterations
x = initial_guess;  % set initial guess
s = [1; 1];         % set s for start while loop

while norm(s)>error && k < max_iter
    s = -inv(hessian(x(1), x(2)))*gradient(x(1), x(2)); % compute newton step
    x = x+s;    % update solution
    k = k+1;    % increase iteraion
end
end

