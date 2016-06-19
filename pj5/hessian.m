function [ z ] = hessian( x, y )
% hessian matrix of rosenbrock function
z = [1200*x.^2+(-400*y+2), -400*x; -400*x, 200];
end

