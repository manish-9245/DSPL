clc
clear;
close all;
x=[5,4,5,4];
h=[2,1,2,1];
m=length(x);
n=length(h);
if(m>n)
    ap2=[h,zeros(1,m-n)];
    ap1=x;
elseif (m==n)
    ap1=x;
    ap2=h;
else
    ap1=[x,zeros(1,n-m)];
    ap2=h;
end
xf=fft(ap1);
hf=fft(ap2);
yf=xf.*hf;
ycc=ifft(yf);