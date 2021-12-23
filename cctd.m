clc
clear;
close all;
x=[5,4,5,4];
h=[2,1,2,1];
N1=length(x);
N2=length(h);
N=max(N1,N2);
if(N2>N1)
    ap1=[x,zeros(1,N-N1)];
    ap2=h;
elseif(N2==N1)
    ap1=x;
    ap2=h;
else
    ap1=x;
    ap2=[h,zeros(1,N-N2)];
end
obtv=zeros(1,N);
for m=0:N-1
    obtv(m+1)=0;
for n=0:N-1
    j=mod(m-n,N);
    obtv(m+1)=obtv(m+1)+ap1(n+1).*ap2(j+1);
end
end
y=cconv(x,h,N);
