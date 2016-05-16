
disp('(a)');
t = 0:0.002:1; % sets up the domain
h = 2*exp(18*pi*t*1i);
subplot(211);
plot(t,h); % and plot it
xlabel('t');
ylabel('h(t)');
title('(a) h = 2*exp(18*pi*t*1i))');
grid;

g = 2*exp(19*pi*t*1i);
subplot(212);
plot(t,g); % and plot it
xlabel('t');
ylabel('g(t)');
title('(a) g = 2*exp(19*pi*t*1i)');
grid;


figure;
y1 = fft(h);
% Magnitude
m1 = y1.*conj(y1);
% Phase
p1 = unwrap(angle(y1));
y2 = fft(g);
% Magnitude
m2 = y2.*conj(y2);
% Phase
p2 = unwrap(angle(y2));


f = (0:length(y1)-1)*500/length(y1);
subplot(2,2,1);
plot(f,m1);
title('Magnitude of spectrum of h');

subplot(2,2,2);
plot(f,p1*180/pi);
title('Phase spectrum of h');


subplot(2,2,3);
plot(f,m2);
title('(d) Magnitude of spectrum of g');

subplot(2,2,4);
plot(f,p2*180/pi);
title('Phase spectrum of g');
