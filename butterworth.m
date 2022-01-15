clc;
close all;
clear all;
fc=500;
fs=2000;
n=2;
wn=2*fc/fs;
[b,a]=butter(n,wn);
[h,c]=freqz(b,a,512,fs);
m=20*log(abs(h));
figure(1);
plot(c,m)
grid;

%verification
f1=100;
f2=300;
f3=700;
p=50;
n=0:49;
t=0:(3*p)-1;
x1=sin(2*pi*f1*n/fs);
x2=sin(2*pi*f2*n/fs);
x3=sin(2*pi*f3*n/fs);
x=[x1,x2,x3];
y=filter(b,a,x);
figure(2);
subplot(2,1,1);plot(t,x);
subplot(2,1,2);plot(t,y);
    