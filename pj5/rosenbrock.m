function [ z ] = rosenbrock( x, y )
% rosenborck function
z = 100*(y-x.^2).^2 + (1-x).^2;
end

