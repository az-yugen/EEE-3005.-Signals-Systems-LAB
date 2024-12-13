clc; clear; close all;

% Defining parameters
Fs = 50;            % Sampling frequency
T = 1/Fs;           % Sampling period
L = 500;            % Length of signal
t = (0:L-1)*T;      % Time vector

% Define sine wave and rectangular pulse
f_sine = 10;        % Frequency of sine wave
sine_wave = sin(2*pi*f_sine*t); % Sine wave

rect_pulse = (t >= 0.1 & t <= 0.6); % Rectangular pulse

% Compute FFT for sine wave
fft_sine = fft(sine_wave);
P2_sine = abs(fft_sine/L);
P1_sine = P2_sine(1:L/2+1);
P1_sine(2:end-1) = 2*P1_sine(2:end-1);
f_sine_fft = Fs*(0:(L/2))/L;

% Compute FFT for rectangular pulse
fft_rect = fft(rect_pulse);
P2_rect = abs(fft_rect/L);
P1_rect = P2_rect(1:L/2+1);
P1_rect(2:end-1) = 2*P1_rect(2:end-1);
f_rect_fft = Fs*(0:(L/2))/L;




% First figure: Sine wave in time and frequency domains
figure;
subplot(2,1,1);
plot(t, sine_wave, 'r', 'LineWidth', 1.5);
title('Sine Wave (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(f_sine_fft, P1_sine, 'b', 'LineWidth', 1.5);
title('Sine Wave (Frequency Domain)');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% Second figure: Rectangular pulse in time and frequency domains
figure;
subplot(2,1,1);
plot(t, rect_pulse, 'k', 'LineWidth', 1.5);
title('Rectangular Pulse (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(f_rect_fft, P1_rect, 'm', 'LineWidth', 1.5);
title('Rectangular Pulse (Frequency Domain)');
xlabel('Frequency (Hz)');
ylabel('Amplitude');


