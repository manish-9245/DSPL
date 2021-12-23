clc
clear;
close all;
x=[1,2,3,4];
h=[2,1,4,2];
m=length(x);
n=length(h);
N=m+n-1;
xf=fft(x,N);
hf=fft(h,N);
yf=xf.*hf;
ylc=ifft(yf);
y1=conv(x,h);