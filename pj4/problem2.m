N = 100;  % number of iterations

% Set the axis and the grid
m = 1000;
x = linspace(-1, 1, m);
y = linspace(-1, 1, m);
[X,Y] = meshgrid(x,y);
z = X +1j*Y;

% z0, z1, z2 is roots of f(z)=0
z0 = 1;
z1 = -0.5-1j*0.8660254;
z2 = -0.5+1j*0.8660254;

for k=1:N
    z=2/3*z + 1./(3*z.^2);
end

% calculate for z0, z1, z2
figure;
subplot(2, 2, 1)
W=abs(z-z0);
A=angle(z);
colormap prism(256);
pcolor(W-A);
shading flat;
axis('square','equal','off');

subplot(2, 2, 2)
W=abs(z-z1);
A=angle(z);
colormap prism(256);
pcolor(W-A);
shading flat;
axis('square','equal','off');

subplot(2, 2, 3)
W=abs(z-z2);
A=angle(z);
colormap prism(256);
pcolor(W-A);
shading flat;
axis('square','equal','off');
