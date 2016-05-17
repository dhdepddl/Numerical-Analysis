function [  ] = juliaSet( a, N, l, option )
% Julia set generator
%  Input: complex number a, number of iterations n
%       size of window l, coloring option
%  Output: graph of Julia set of equation Q(z)=z^2+a

% set r(a):=max{|a|,2}, threshold radius
r = max(abs(a), 2);

% set axis and grid
figure;
m = 1000;
cx = 0;
cy = 0;
x = linspace(cx-l, cx+l, m);
y = linspace(cy-l, cy+l, m);
[X, Y] = meshgrid(x, y);
z = X + 1j*Y;

% compute orbit of z under Q
for k = 1:N
    z = z.^2+a;
    w = exp(-abs(z));
    b = min(floor(abs(z)/r),1);
end

% option 'black'
if strcmp(option, 'black')
    colormap gray(256);
    pcolor(b);
    shading flat;
    axis('square', 'equal', 'off');
end

% option 'color'
if strcmp(option, 'color')
    colormap prism(256);
    pcolor(w);
    shading flat;
    axis('square', 'equal', 'off');
end
end

