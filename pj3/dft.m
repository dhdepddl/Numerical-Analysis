function [ X ] = dft( x )
% compute dft matrix of x
N = length(x);
X = zeros(1,N);
for i = 0:N-1
    for k = 0:N-1
        X(1, i+1) = X(1, i+1) + x(1,k+1)*exp(-1j*2*pi*i*k/N);
    end
end
end

