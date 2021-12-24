#include<stdio.h>
void main(){
    int i,j,k,m=4,n=4,N;
    int x[10]={5,4,5,4};
    int h[10]={2,1,2,1};
    int y[10]={0};
    N=m;
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            k=i+j;
            if(k>=N){
                k=k-N;
            }
            y[k]+=x[j]*h[i];
        }
    }
    printf("The circular convolution of X and h is");
    for(i=0;i<N;i++)
        printf("\n%d",y[i]);
}
