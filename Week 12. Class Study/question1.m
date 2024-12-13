clc; clear; close all;

dt = 0.2;                                 % delta time step

figure('Name','Decreasing convolution step size');

subplot(2,2,1)
p1 = plot(NaN,NaN,'r');
title('$u(t)$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('u(t)')

subplot(2,2,2)
p2 = plot(NaN,NaN, 'g');
title('$f(t)=e^{-5t}$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('f(t)')

subplot(2,2,[3;4])
p3 = plot(NaN,NaN);
title('$y(t)=u(t) * f(t)$','Interpreter','latex'),
grid on, xlabel('t'), ylabel('y(t)'), xlim([0 20])


% ANIMATE PLOT WHILE DECREASING STEP SIZE
for i = 1:10

    t1 = 0:dt:10;                        % defined time interval
    ut = heaviside(t1);               % step function
    ft = exp(-5*t1);               % gien exp function

    yt = dt*conv(ut,ft);                % their convolution
    t2 = (1:length(yt)).*dt;            % convolution time axis

    set(p1, 'xdata', t1, 'ydata', ut);  % update sine plot with new dt
    set(p2, 'xdata', t1, 'ydata', ft);  % update cosine plot with new dt
    set(p3, 'xdata', t2, 'ydata', yt);  % update conv plot with new dt

    dt = dt/2;                          % reduce dt in half each iter for i=10
    
    pause(1); drawnow;                  % animate every 1 sec

end
