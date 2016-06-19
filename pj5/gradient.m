function [ z ] = gradient( x, y )
% gradient matrix of rosenbrock function
z = [100*(2*(x.^2-y)* 2*x) - 2*(1-x); 100*(-2*(x.^2-y))];
end

