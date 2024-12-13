clc; clear; close all;

fs = 500;
duration = 2;
sampling = fs*duration;

T = 0:1/fs:duration-1/fs;

amp1 = 3; amp2 = 3; amp3 = 1;
freq1 = 30; freq2 = 45; freq3 = 70;
phase1 = 0.6; phase2 = -0.8; phase3 = 2;

f1 = amp1*cos(2*pi*freq1*T+phase1);
f2 = amp2*cos(2*pi*freq2*T+phase2);
f3 = amp3*cos(2*pi*freq3*T+phase3);

f = f1+f2+f3;

Y = fft(f);

Theta = angle(Y);

figure('Name','FFT');
subplot(4,3,1), plot(T,f1),
title('$f_1(t) = 3 \cdot cos(2\pi \cdot 30 \cdot t+0.6)$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('f1(t)')

subplot(4,3,2), plot(T, f2),
title('$f_2(t) = 3 \cdot cos(2\pi \cdot 45 \cdot t-0.8)$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('f2(t)')

subplot(4,3,3), plot(T, f3),
title('$f_3(t) = 1 \cdot cos(2\pi \cdot 70 \cdot t+2)$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('f3(t)')

subplot(4,3,[4;6]), plot(T, f,'r'),
title('$f_1(t)+f_2(t)+f_3(t)$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('f(t)')

subplot(4,3,[7;9]), plot(T, Y,'r'),
title('$FFT, f*$','Interpreter','latex'),
grid on, ylabel('f*(t)')

subplot(4,3,[10;12]), plot(T, Theta,'r'),
title('$Angle$','Interpreter','latex'),
grid on, ylabel('angle')





