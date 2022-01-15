clc
clear all
l=[941,697,697,697,770,770,770,852,852,852,697,770,852,941,941,941];
h=[1336,1209,1336,1477,1209,1336,1477,1209,1336,1477,1633,1633,1633,1633,1209,1477];
disp('DIGIT Dialled');
d=14
N=205;
%to generate signal corresponding to digit
f1=l(d+1);
f2=h(d+1);
n=1:N;
x=sin(2*pi*n*f1/8000)+sin(2*pi*f2*n/8000);
plot(n,x);
%To detect DTMF signal
z=sqrt(-1);
k=[18,20,22,24,31,34,38,42];
for m=1:8
    N=205;
    xe=x;
    x1=[xe 0];
    d1=2*cos(2*pi*k(m)/N);
    w=exp(-z*2*pi*k(m)/N);
    y=filter(1,[1 -d1 1],x1);
    Fx(m)=y(N+1)-w*y(N);
    val=abs(Fx);
end
limit =8100;
disp('Digit Detected');
if val(1)*val(5)>limit
    disp('1')
end
if val(1)*val(6)>limit
    disp('2')
end
if val(1)*val(7)>limit
    disp('3')
end
if val(2)*val(5)>limit
    disp('4')
end
if val(2)*val(6)>limit
    disp('5')
end
if val(2)*val(7)>limit
    disp('6')
end
if val(3)*val(5)>limit
    disp('7')
end
if val(3)*val(6)>limit
    disp('8')
end
if val(3)*val(7)>limit
    disp('9')
end
if val(1)*val(8)>limit
    disp('A')
end
if val(2)*val(8)>limit
    disp('B')
end
if val(3)*val(8)>limit
    disp('C')
end
if val(4)*val(8)>limit
    disp('D')
end
if val(4)*val(6)>limit
    disp('0')
end
if val(4)*val(7)>limit
    disp('#')
end
if val(4)*val(5)>limit
    disp('*')
end
