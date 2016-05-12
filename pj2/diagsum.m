function [ sum ] = diagsum( A )
%UNTITLED4 이 함수의 요약 설명 위치
%   자세한 설명 위치
n = length(A);
sum = 0;
for i = 1:n
    sum = sum+abs(A(i, i));
end
end

