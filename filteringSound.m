clear all;
close all;
clc;
load chirp


fsHz = 65536;
dt = 1/fsHz;
t = 0:dt:5-dt;

[y,Fs] = audioread('sum_sound.wav');
w1=2*1000/65536
w2=2*15000/65536
b1 = fir1(48,w1);
b2 = fir1(48,w2,'high');
b3 = fir1(48,[w1 w2]);
a = 1;
low_pass = filter(b1,a,y);
high_pass=filter(b2,a,y);
band_pass=filter(b3,a,y);

subplot(3,2,1);
plot(t,low_pass)
xlim([0 0.1])
xlabel("time");
ylabel("signal");
title('lowpass Filtered Signal')

N = 65536;
transform = fft(low_pass,N)/N;
magTransform = abs(transform);

faxis = linspace(-fsHz/2,fsHz/2,N);
subplot(3,2,2);
plot(faxis/1000,fftshift(magTransform));
axis([-5 5 0 0.6])
xlabel('Frequency (KHz)')
ylabel('power of the lowpass filtered signal')



subplot(3,2,3);
plot(t,high_pass)
xlim([0 0.001])
xlabel("time");
ylabel("signal");
title('highpass Filtered Signal')

N = 65536;
transform = fft(high_pass,N)/N;
magTransform = abs(transform);

faxis = linspace(-fsHz/2,fsHz/2,N);
subplot(3,2,4);
plot(faxis/1000,fftshift(magTransform));
axis([-20 20 0 0.6])
xlabel('Frequency (KHz)')
ylabel('power of the lowpass filtered signal')


subplot(3,2,5);
plot(t,band_pass)
xlim([0 0.001])
xlabel("time");
ylabel("signal");
title('bandpass Filtered Signal')

N = 65536;
transform = fft(band_pass,N)/N;
magTransform = abs(transform);

faxis = linspace(-fsHz/2,fsHz/2,N);
subplot(3,2,6);
plot(faxis/1000,fftshift(magTransform));
axis([-20 20 0 0.6])
xlabel('Frequency (KHz)')
ylabel('power of the lowpass filtered signal')