% Sampling theorem in frequency domain
tfinal = 0.01;
t = 0:0.00001:tfinal;
xanalog = cos(2*pi*400*t) + cos(2*pi*700*t);

% Critical sampling fs=2fm(fm=700)
fs = 1400;
tsamp = 0:1/fs:13/fs;
xsampled = cos(2*pi*400*tsamp) + cos(2*pi*700*tsamp);
xsampled_DFT = abs(fft(xsampled));
xsampled_length = 0:length(xsampled_DFT)-1;
figure(1); 
subplot(4,1,1);
stem(100*xsampled_length, xsampled_DFT);
xlabel('Frequency'); ylabel('Magnitude'); title('Critical Sampling (fs=2fm)');

xreconstructed = ifft(fft(xsampled));
subplot(4,1,2); plot(tsamp, xreconstructed, 'b*-');
xlabel('Time'); ylabel('Amplitude'); title('Critical Sampling (fs=2fm)');

% Under Sampling(fs<2fm)
fs = 700;
tsamp = 0:1/fs:6/fs;
xsampled = cos(2*pi*400*tsamp) + cos(2*pi*700*tsamp);
xsampled_DFT = abs(fft(xsampled));
xsampled_length = 0:length(xsampled_DFT)-1;
subplot(4,1,3); stem(100*xsampled_length, xsampled_DFT);
xlabel('Frequency'); ylabel('Magnitude'); title('Under Sampling (fs<2fm)');

xreconstructed = ifft(fft(xsampled));
subplot(4,1,4); plot(tsamp, xreconstructed, 'b*-');
xlabel('Time'); ylabel('Amplitude'); title('Under Sampling (fs<2fm)');

% Over Sampling(fs>2fm)
fs = 2000;
tsamp = 0:1/fs:19/fs;
xsampled = cos(2*pi*400*tsamp) + cos(2*pi*700*tsamp);
xsampled_DFT = abs(fft(xsampled));
xsampled_length = 0:length(xsampled_DFT)-1;
figure(2); subplot(4,1,1); stem(100*xsampled_length, xsampled_DFT);
xlabel('Frequency'); ylabel('Magnitude'); title('Over Sampling (fs>2fm)');

xreconstructed = ifft(fft(xsampled));
subplot(4,1,2); plot(tsamp, xreconstructed, 'b*-');
xlabel('Time'); ylabel('Amplitude'); title('Over Sampling (fs>2fm)');
