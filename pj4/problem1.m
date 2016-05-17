disp('(a)');
juliaSet(-1, 15, 15, 'black');
juliaSet(-1, 10, 1.5, 'color');
juliaSet(-1, 6, 1.5, 'color');
juliaSet(-1, 15, 1.5, 'color');
  
disp('(b)');
juliaSet(-0.1+0.8j, 15, 1.5, 'black');
juliaSet(-0.1+0.8j, 10, 1.5, 'color');
juliaSet(-0.1+0.8j, 6, 1.5, 'color');
juliaSet(-0.1+0.8j, 15, 1.5, 'color');


disp('(c)');
N = 5;  % coloring with changing the number of iterations N
figure;
m = 1000;
x = linspace(-2, 2, m);
y = linspace(-2, 2, m);
[X, Y] = meshgrid(x, y);
z = X + 1j*Y;

% compute orbit of z under Q
for k = 1:N
    z = (1+2j)*exp(z);  % same step to juliaSet function 
    w = exp(-abs(z));   % except the function
    b = min(floor(abs(z)),1);
end

colormap gray(256);
pcolor(b);
shading flat;
axis('square', 'equal', 'off');

figure;
colormap prism(256);
pcolor(w);
shading flat;
axis('square', 'equal', 'off');



disp('(d)');
N = 5;  % coloring with changing the number of iterations N
m = 1000;
x = linspace(-2, 2, m);
y = linspace(-2, 2, m);
[X, Y] = meshgrid(x, y);
z = X + 1j*Y;

for k = 1:N
    z = 2*pi*1j*exp(z);  % same step to (c) 
    w = exp(-abs(z)/2);  % except divide norm by 2
    b = min(floor(abs(z)),1);
end

figure;
colormap gray(256);
pcolor(b);
shading flat;
axis('square', 'equal', 'off');

figure;
colormap prism(256);
pcolor(w);
shading flat;
axis('square', 'equal', 'off');
