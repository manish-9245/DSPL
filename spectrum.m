clc
close all
n=1:16;
N=32;
f=1000;
fs=8000;
x=sin(2*pi*f/fs.*n);
z=zeros(1,16);
x=[x z];
xf=fft(x);
yf=abs(xf);
k=1:32;
f=(0:N-1).*fs/N;
plot(f,yf);