clc; clear; close all;

% SYMBOLIC COMPUTATION USING CONVOLUTION DEFINITION
syms t tau real
fs(t) = exp(-t);
gs(t) = sin(t);
ys(t) = int(fs(t-tau)*gs(tau),tau);        % symbolic expression for y=f*g
yst(t) = int(fs(t-tau)*gs(tau),tau, 0, t); % result with bounds 0<tau<t
ys(t), yst(t)                              % display result

figure('Name','Convolution using definition');
subplot(2,2,1), fplot(fs(t), [0,100], 'r'),
title('$f(t)=e^{-t}$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('f(t)')

subplot(2,2,2), fplot(gs(t), [0,100], 'g'),
title('$g(t)=sin(t)$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('g(t)')

subplot(2,2,[3;4]), fplot(yst(t), [0,100]),
title('$y(t)=e^{-t}*sin(t)$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('y(t)')


% NUMERICAL COMPUTATION USING BUILT-IN CONV() FUNCTION
dt = 0.01;                     % delta time step
t1 = 0:dt:100;

ft = exp(-t1);
gt = sin(t1);

st = 0;                        % corrective time shift in conv time axis = 0
yt = dt*conv(ft,gt);           % multipyling by dt to normalize yt amplitude
t2 = (1:length(yt)).*dt - st;  % multiplying by dt to normalize time axis

figure('Name','Convolution using conv function');
subplot(2,2,1), plot(t1,ft,'r'),
title('$f(t)=e^{-t}$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('f(t)')

subplot(2,2,2), plot(t1,gt, 'g'),
title('$g(t)=sin(t)$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('g(t)')

subplot(2,2,[3;4]), plot(t2, yt),
title('$y(t)=e^{-t}*sin(t)$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('y(t)'), xlim([0 100])


