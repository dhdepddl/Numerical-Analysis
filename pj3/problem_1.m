
disp('(a)');
t = 0:1/300:1; % sets up the domain
x = cos(160*pi*t) + 2*sin(100*pi*t);
subplot(211);
plot(t,x); % and plot it
xlabel('t');
ylabel('x(t)');
title('(a) x(t) = cos(160*pi*t) + 2*sin(100*pi*t)');
grid;

t = 0:1/300:1; % sets up the domain
noise = (1+randsample(2,1))*randn(size(t));
xs = cos(160*pi*t) + 2*sin(100*pi*t) + noise;
subplot(212);
plot(t,xs); % and plot it
xlabel('t');
ylabel('xs(t)');
title('(a) xs(t) = cos(160*pi*t) + 2*sin(100*pi*t) + epsilon');
grid;


disp('(b)');
figure;
N = 300;
n = 0:N-1;
noise = (1+randsample(2,1))*randn(size(n));
xs2 = cos(160*pi*n/N) + 2*sin(100*pi*n/N) + noise;
stem(n,xs2);
xlabel('n');
ylabel('xs[n] = xs(nT)');
title('(b) discrete time siganl with size N=300');


disp('(c)');
% Compute DFT of xs2 using built-in function fft
y = fft(xs2);
disp(y);


% Compute DFT of xs2 using custom dft functionfft
y2 = dft(xs2);
disp(y2);

disp('(d)');
figure;
% Magnitude
m = fft(x).*conj(fft(x));
% Phase
p = unwrap(angle(fft(x)));

f = (0:length(fft(x))-1)*300/length(fft(x));
subplot(2,1,1);
plot(f,m);
title('(d) Magnitude of spectrum of x(t)');
xlabel('Frequency(Hz)');
ax = gca;
ax.XTick = [50 80 220 250];

subplot(2,1,2);
plot(f,p*180/pi);
title('(d) Phase spectrum of x(t)');
xlabel('Frequency(Hz)');
ax = gca;
ax.XTick = [50 80 220 250];

figure;
% Magnitude
m = y.*conj(y);
% Phase
p = unwrap(angle(y));

f = (0:length(y)-1)*300/length(y);
subplot(2,1,1);
plot(f,m);
title('(d) Magnitude of spectrum of xs2 with using fft');
xlabel('Frequency(Hz)');
ax = gca;
ax.XTick = [50 80 220 250];

subplot(2,1,2);
plot(f,p*180/pi);
title('(d) Phase spectrum of xs2 with using fft');
xlabel('Frequency(Hz)');
ax = gca;
ax.XTick = [50 80 220 250];

figure;
% Magnitude
m = y2.*conj(y2);
% Phase
p = unwrap(angle(y2));

f = (0:length(y2)-1)*300/length(y2);
subplot(2,1,1);
plot(f,m);
title('(d) Magnitude of spectrum of xs2 with using dft');
xlabel('Frequency(Hz)');
ax = gca;
ax.XTick = [50 80 220 250];

subplot(2,1,2);
plot(f,p*180/pi);
title('(d) Phase spectrum of xs2 with using dft');
xlabel('Frequency(Hz)');
ax = gca;
ax.XTick = [50 80 220 250];


disp('(e)');
% low-pass filter
figure;
Fs = round(20*pi); % Sampling frequency
t = 0:1/3000:0.1;
Wn = 3; % cut-off frequency
Fn = Fs/2; % Nyquist frequency
noise = (1+randsample(2,1))*randn(size(t));
x = cos(160*pi*t) + 2*sin(100*pi*t);
xs = cos(160*pi*t) + 2*sin(100*pi*t) + noise;
[b,a] = butter(10, Wn/Fn, 'low');
freqz(b,a);
figure;
subplot(3,1,1); plot(t, x);
xlabel('t');
ylabel('x(t)');
title('original x(t) for one cycle');
subplot(3,1,2); plot(t, xs);
xlabel('t');
ylabel('xs(t)');
title('x(t) with noise');
y_low = filter(b,a,xs);
subplot(3,1,3); plot(t,y_low);
xlabel('t');
ylabel('filtered xs(t)');
title('filtered x(t) with noise');

%high-pass filter
figure;
Wn = 10; % cut-off frequency
[b,a] = butter(10, Wn/Fn, 'high');
freqz(b,a);
figure;
subplot(3,1,1); plot(t, x);
xlabel('t');
ylabel('x(t)');
title('original x(t) for one cycle');
subplot(3,1,2); plot(t, xs);
xlabel('t');
ylabel('xs(t)');
title('x(t) with noise');
y_high = filter(b,a,xs);
subplot(3,1,3); plot(t,y_high);
xlabel('t');
ylabel('filtered xs(t)');
title('filtered x(t) with noise');


