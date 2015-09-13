clear all; close all; clc
P = [1 1 1 1
     0 0 1 1
     0 1 0 1];
 T = [0 1 1 1];
 w=randn(1,3);
 [in,pt]=size(P);
 alfa=0.1; 
 ep=0; 
 emse=1;
 pesos=zeros(1,3);
 salidas=zeros(1,4);
 error=ones(1,4);
 Emse=ones(1);
 y=zeros(1,4);
 e=ones(1,4);
 while emse~=0
     ep=ep+1;
     for k=1:pt
         n=w*P(:,k);
         y(:,k)=hardlim(n);
         e(:,k)=T(:,k)-y(:,k);
         w=w+alfa*e(:,k)*P(:,k)';
     end
     emse=mse(e);
     pesos(ep,:)=w;
     salidas(ep,:)=y;
     error(ep,:)=e;
     Emse(ep)=emse;
 end
Se=size(error);
N=Se(1);
wf=pesos(N,2:in);
bf=pesos(N,1);
subplot(211)
plotpv(P(2:3,:),T)
plotpc(wf,bf)
grid
subplot(212)
k=0:ep-1;
plot(k,Emse,'k')
title('Evolución del error')
grid
%axis([0 10 0 1])
