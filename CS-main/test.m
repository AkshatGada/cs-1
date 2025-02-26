%critical Sampling fs=2fm(fm=700)
fs=1400;
tsamp=0:1/fs:tfinal;
xsampled=cos(2*pi*400*tsamp)+cos(2*pi*700*tsamp);
subplot(4,1,2);
plot(tsamp,xsampled,'b*-')
xlabel('Time');
ylabel('Amplitude');
title('Critical Sampling (fs=2fm)');

% Critical sampling fs=2fm(fm=700)
fs = 1400;
tsamp = 0:1/fs:13/fs;
xsampled = cos(2*pi*400*tsamp) + cos(2*pi*700*tsamp);
xsampled_DFT = abs(fft(xsampled));
xsampled_length = 0:length(xsampled_DFT)-1;
figure(1); 
subplot(4,1,1);
stem(100*xsampled_length, xsampled_DFT);
xlabel('Frequency');
ylabel('Magnitude'); 
title('Critical Sampling (fs=2fm)');
xreconstructed = ifft(fft(xsampled));
subplot(4,1,2); 
plot(tsamp, xreconstructed, 'b*-');
xlabel('Time'); 
ylabel('Amplitude'); 
title('Critical Sampling (fs=2fm)');