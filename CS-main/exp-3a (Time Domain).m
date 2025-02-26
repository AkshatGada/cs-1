clc;
clear all;
close all;

tfinal=0.01;
t=0:0.00001:tfinal;
xanalog=cos(2*pi*400*t)+cos(2*pi*700*t);
subplot(4,1,1)
plot(t,xanalog,'r-')
xlabel('time');
ylabel('Amplitude');
title('Analog Signal');


%critical Sampling fs=2fm(fm=700)
fs=1400;
tsamp=0:1/fs:tfinal;
xsampled=cos(2*pi*400*tsamp)+cos(2*pi*700*tsamp);
subplot(4,1,2);
plot(tsamp,xsampled,'b*-')
%stairs(tsamp,xsampled,'b*-');
xlabel('Time');
ylabel('Amplitude');
title('Critical Sampling (fs=2fm)');


%Under Sampling (fs=2fm)
fs=700;
tstamp=0:1/fs:tfinal;
xsampled=cos(2*pi*400*tsamp)+cos(2*pi*700*tsamp);
subplot(4,1,3);
plot(tsamp,xsampled,'b*-');
%Stairs(tsamp,xsamped,'b*-');
xlabel('Time');
ylabel('Amplitude');
title('Under Sampling(fs<2fm)');


%Over Sampling (fs>2fm)
fs=2000;
tsamp=0:1/fs:tfinal;
xsampled=cos(2*pi*400*tsamp)+cos(2*pi*700*tsamp);
subplot(4,1,4)
plot(tsamp,xsampled,'b*-')
%Stairs(tsamp,xsampled,'b*-');
xlabel('Time');
ylabel('Amplitude');
title('Over Sampling (fs>2fm)');
