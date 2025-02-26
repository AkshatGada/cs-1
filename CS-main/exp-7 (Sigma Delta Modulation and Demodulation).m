clc
close all

t = -5:0.01:5;
f = 2;
w = 2 * pi * f;
osr = 250;
fs1 = w / pi;
fs = fs1 * osr;

ts = -5:1/fs:5;
y = @(t) sin(w .* t);

[u, q] = SDQ(y(ts), ts);

z = 0;
for k = 1:length(ts)
    z = z + q(k) .* sinc(w .* (t - ts(k)));
end
c = max(y(t)) ./ max(z);
z = z .* c;

figure(1)
subplot(311), plot(t, y(t), 'linewidth', 2), title('Original signal'), xlabel('Time'), ylabel('Amplitude')
subplot(312), plot(ts, q), title('SDQ signal'), xlabel('Time'), ylabel('Amplitude')
subplot(313), plot(t, z, 'linewidth', 2), title('Reconstructed signal'), xlabel('Time'), ylabel('Amplitude')
figure(2), plot(t, y(t), 'linewidth', 2), hold on, plot(t, z, 'linewidth', 2), title('Original vs Reconstructed')
figure(3), plot(abs(z - y(t)), 'linewidth', 0.5), title('Error')
figure(4)
subplot(311), plot(abs(fftshift(fft(y(t)))) / length(t)), xlabel('Frequency'), ylabel('Amplitude'), title('Spectrum of original signal')
subplot(312), plot(abs(fftshift(fft(q))) / length(ts)), xlabel('Frequency'), ylabel('Amplitude'), title('Spectrum of SDQ')
subplot(313), plot(abs(fftshift(fft(z))) / length(t)), title('Spectrum of recovered signal'), xlabel('Frequency'), ylabel('Amplitude')



function [u, q] = SDQ(y,~)
    q = sign(y);
    u = cumsum(y - q) + 0.9;
end
end
