function [ sum ] = nondiag( A )
%UNTITLED3 이 함수의 요약 설명 위치
%   자세한 설명 위치
n = length(A);
sum = 0;
for i = 1:n
    each = 0;
    for j = 1:n
        each = each + abs(A(i, j));
    end
    each = each - abs(A(i, i));
    sum = sum + each;
end
end

