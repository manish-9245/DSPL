#include<stdio.h>
#include<math.h>
#define es 2

void bitrev(float a[64], float b[64]);
void fft(float w[64], float e);

void main(){
    float z[64],e,p[64],x[64],a[64];
    int i,i1,k,N;
    for(i=0;i<16;i++){
        i1 = 2*i;
        x[i1] = sin(2*3.1416*i/8000);
        x[i + 1] = 0.0;
    }
    for(i=32;i<64;i++){
        x[i] = 0;
        N=32;
        e = 3.14*2/N;
        fft(x,e);
        bitrev(p,x);
        for(i=0;i<32;i++){
            x[i] = 0;
            k= 2*i;
            a[i] = sqrt(p[k]*p[k]+p[k+1]*p[k+1]);
            printf("%f\n",a[i]);
        }
        i=0;//Breakpoint
    }
}

void bitrev(float a[64], float b[64]){
    int n=16,i,i1,k,k1,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10;
    for(i=0;i<32;i++){
        q1=i/2;
        q2=i%2;
        q3=q1/2;
        q4=q1%2;
        q5=q3/2;
        q6=q3%2;
        q7=q5/2;
        q8=q5%2;
        q9=q7/2;
        q10=q7%2;
        k=q10+2*q8+4*q6+8*q4+16*q2;
        k1 = es*i;
        i1 = es*i;
        a[i1] = b[k1];
        a[i1+1] = b[k1+1];
    }
}

void fft(float x[64], float e){
    int nd=16,M=5,m,n2,L,i,N=32,nt=32;
    float a,sin_a,cos_a,ti,tr;
    for(m=0;m<M;m++){
        a = 0;
        for(n2=0;n2<nd*es;n2=n2+es){
            sin_a=sin(a);
            cos_a=cos(a);
            a = a+e;
            for(i=n2;i<es*N;i=i+nt*es){
                L = i+nd*es;
                tr = x[i]-x[L];
                ti = x[i+1] - x[L+1];
                x[L+1] = cos_a*ti-sin_a*tr;
                x[L] = cos_a*tr-sin_a*ti;
            }
        }
        nt=nd;
        nd=nd/2;
        e=2*e;
    }
}
