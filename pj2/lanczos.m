function [ alpha, beta, gamma ] = lanczos( A )
% lanczos for symmetric matrix
% return alpha, beta after n iteration
% and gamma which is eigenvalues of A
% and draw graph of Ritz values

% Initial setting
n = length(A);
q = zeros(n, n);
x0 = rand(n, 1);  % arbitrary nonzero starting vector
beta = zeros(n, 1);
u = zeros(n, n);
alpha = zeros(n, 1);
q(:,1) = x0/norm(x0);
T = zeros(n+1, n+1);

% Initial setting for graph
figure(1);
title('Ritz value graph');
axis([0 n 0 n]);
xlabel('Ritz values');
ylabel('iteration');
hold on;

for k=1:n 
    U = A*q(:,k);
    alpha(k)=q(:,k)'*U;
    
    % calculate u_k
    if k==1
        u(:,k) = U - alpha(k)*q(:,k);
    else
        u(:,k) = U - q(:,k-1)*beta(k-1) - alpha(k)*q(:,k);
    end
    
    beta(k)=norm(u(:,k));
    
    % stop if matrix is reducible
    if beta(k) == 0
        break
    end
    
    % normalize 
    q(:,k+1) = u(:,k)/beta(k);
    
    % graph of Ritz values
    T(k, k) = alpha(k);
    T(k+1, k) = beta(k);
    T(k, k+1) = beta(k);
    plot(eig(T(1:k, 1:k)), k, '.k');
end

% eigenvalues after n iteration
gamma = qriteration(T);
end

