function [ ] = mandelbrot( n, N, option )
% mandelbrot set generator
%  Input: order of equation n, number of iterations n, coloring option
%  output: graph of mandelbrot set of equation Q(z)=z^2+a

% set grid 1000x1000 and window 2x2
figure;
m = 1000;
x = linspace(-2,2,m);
y = linspace(-2,2,m);
[X,Y] = meshgrid(x,y);
z = X +1j*Y;
a = z;

% compute orbit of Q_a^n(0)
for k=1:N
    z = z.^n + a;
    b = min(floor(abs(z)/2),1);
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
    w = exp(-abs(z));
    colormap prism(256);
    pcolor(w);
    shading flat;
    axis('square', 'equal', 'off');
end

% option 'cool'
if strcmp(option, 'cool')
    w = exp(-abs(z));
    colormap cool(256);
    pcolor(w);
    shading flat;
    axis('square', 'equal', 'off');
end

% option 'hot'
if strcmp(option, 'hot')
    w = exp(-abs(z));
    colormap hot(256);
    pcolor(w);
    shading flat;
    axis('square', 'equal', 'off');
end
end

