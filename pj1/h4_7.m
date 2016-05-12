disp('4-7');
n = 50;

% condition of problem
B = rand(n,n);
[Q, R] = qr(B);
D = diag(1:n);
A = Q*D*Q';

% default matrix setting
q = zeros(n,n+1);
u = zeros(n,n+1);
a = zeros(n+1,1);
b = zeros(n+1,1);
T = zeros(n+1,n+1);
x = rand(n,1);

q(:, 2) = x / norm(x, 2); % q1 = x0/||x0||_2 : normalize

% graph setting
figure(1);
title('4.7 graph');
axis([0 n 0 n]);
xlabel('Ritz values');
ylabel('iteration');
hold on;

for k = 2:n+1
    u(:, k) = A * q(:, k); % uk = A*qk : generate next vector
    a(k) = q(:, k)' * u(:, k); % ak = qk^H*uk : subtract off its components in two preceding vectors
    u(:, k) = u(:, k) - b(k-1) * q(:, k-1) - a(k) * q(:, k); % uk = uk - bk-1*qk-1 - ak*qk : : subtract off its components in two preceding vectors
    b(k) = norm(u(:, k), 2); % bk = ||uk||_2
    % stop if matrix is reducible
    if b(k) == 0
        break;
    end
    
    %graph coordinate
    T(k-1, k-1) = a(k);
    T(k, k-1) = b(k);
    T(k-1, k) = b(k);
    plot(eig(T(1:k-1, 1:k-1)), k-1, '.k');
    
    q(:, k+1) = u(:, k) / b(k); % qk+1 = uk/bk : normalize
end
