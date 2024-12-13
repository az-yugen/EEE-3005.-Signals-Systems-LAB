clear;
close all;
n1 = 0:1:9;                         % discrete time n1: 0 and first 9 integers
y1 = [ 1 2 3 1 2 3 4 5 1 2];        % 1st functin y1
h1 = [ 1 1 1 2 1 -1 1 1 -2 -1];     % 2nd function h1
X = conv(n1, h1);                   % convolution of n1 (ramp) and h1
n2 = 0:length(X)-1;                 % setting up new time axis n2 for X
figure(1)
subplot(3,1,1)
stem(n1, y1)                        % plotting 1st function y1 to n1
title('y[n]');
subplot(3,1,2)
stem(n1, h1)                        % plotting 2nd function h1 to n1
title('h[n]');
subplot(3,1,3)
stem(n2, X)                         % plotting convolution to its axis n2
title('n1[n]*h[n]');
