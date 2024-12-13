clc; clear; close all;

dt = 1;                                 % delta time step
f1 = 10;                                % sine frequency
f2 = 15;                                % cosine frequency

figure('Name','Decreasing convolution step size');

subplot(2,2,1)
p1 = plot(NaN,NaN,'r');
title('$g(t)=sin(2\pi10t)$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('g(t)')

subplot(2,2,2)
p2 = plot(NaN,NaN, 'g');
title('$h(t)=cos(2\pi15t)$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('h(t)')

subplot(2,2,[3;4])
p3 = plot(NaN,NaN);
title('$y(t)=sin(2\pi10t)*cos(2\pi15t)$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('y(t)'), xlim([0 2])


% ANIMATE PLOT WHILE DECREASING STEP SIZE
for i = 1:10

    t1 = 0:dt:2;                        % defined time interval
    gt = sin(2*pi*f1*t1);               % sine function
    ht = cos(2*pi*f2*t1);               % cosine function

    yt = dt*conv(gt,ht);                % their convolution
    t2 = (1:length(yt)).*dt;            % convolution time axis

    set(p1, 'xdata', t1, 'ydata', gt);  % update sine plot with new dt
    set(p2, 'xdata', t1, 'ydata', ht);  % update cosine plot with new dt
    set(p3, 'xdata', t2, 'ydata', yt);  % update conv plot with new dt

    dt = dt/2;                          % reduce dt in half each iter for i=10
    
    pause(1); drawnow;                  % animate every 1 sec

end
