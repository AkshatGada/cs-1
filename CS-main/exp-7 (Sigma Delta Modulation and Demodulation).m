clc;
close all;

t = -5:0.01:5;  % Time axis for original signal
f = 2;  % Frequency of original signal
w = 2 * pi * f;  % Angular frequency
osr = 250;  % Oversampling ratio
fs1 = w / pi;  % Nyquist frequency
fs = fs1 * osr;  % Oversampled frequency
ts = -5:1/fs:5;  % Time axis for quantized signal

y = @(t) sin(w .* t);  % Original signal

[u, q] = SDQ(y(ts), ts);  % SDQ (Sigma-Delta Quantization) function

% Reconstruction using sinc interpolation
z = 0;
for k = 1:length(ts)
    z = z + q(k) .* sinc(fs * (t - ts(k)));  % fs included in sinc argument
end

c = max(y(t)) / max(z);  % Scaling factor for normalization
z = z .* c;  % Normalize the reconstructed signal

% Plotting the results
figure(1);
subplot(311), plot(t, y(t), 'linewidth', 2), title('Original signal'), xlabel('Time'), ylabel('Amplitude');
subplot(312), plot(ts, q), title('SDQ signal'), xlabel('Time'), ylabel('Amplitude');
subplot(313), plot(t, z, 'linewidth', 2), title('Reconstructed signal'), xlabel('Time'), ylabel('Amplitude');

figure(2);
plot(t, y(t), 'linewidth', 2), hold on, plot(t, z, 'linewidth', 2), title('Original vs Reconstructed');

figure(3);
plot(abs(z - y(t)), 'linewidth', 0.5), title('Error');

figure(4);
subplot(311), plot(abs(fftshift(fft(y(t)))) / length(t)), xlabel('Frequency'), ylabel('Amplitude'), title('Spectrum of original signal');
subplot(312), plot(abs(fftshift(fft(q))) / length(ts)), xlabel('Frequency'), ylabel('Amplitude'), title('Spectrum of SDQ');
subplot(313), plot(abs(fftshift(fft(z))) / length(t)), title('Spectrum of recovered signal'), xlabel('Frequency'), ylabel('Amplitude');

% SDQ function definition
function [u, q] = SDQ(y, ~)
    q = sign(y);  % Quantization by sign
    u = cumsum(y - q) + 0.9;  % Error accumulation for Sigma-Delta
end
