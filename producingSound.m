clear all;
close all;
clc;

Amp = 1;%amplitude
freqHz = 1000;
fsHz = 65536;
dt = 1/fsHz;
t = 0:dt:5-dt;
sine300 = Amp * sin(2*pi*300*t);
sine5k = Amp * sin(2*pi*5000*t);
sine18k = Amp * sin(2*pi*18000*t);
sum=sine300+sine5k+sine18k;
sound(sum,fsHz);
audiowrite("sum_sound.wav",sum,fsHz);

subplot(2,1,1);
plot(t,sum);
xlim([0 0.01])
xlabel("time");
ylabel("signal");

N = 65536;
transform = fft(sum,N)/N;
magTransform = abs(transform);

faxis = linspace(-fsHz/2,fsHz/2,N);
subplot(2,1,2);
plot(faxis/1000,fftshift(magTransform));
axis([-40 40 0 0.6])
xlabel('Frequency (KHz)')
ylabel('power of the signal')