close all; clc; clear all;
% Algoritmo del perceptron (codigo puro Matlab)
P=[1 1 1 1   % Fila de bias
   0 0 1 1
   0 1 0 1];
T=[0 1 1 1]; % Aprendizaje funcion logica OR
w=randn(1,3);
alpha=0.5;   % Factor de aprendizaje
emse=1;      % Error (mean square error)
it=0;
a=zeros(1,1);
e=ones(1,1);
error=zeros(1,4);
while (mse(e)~=0)
    it=it+1;
    for k=1:4
        a(k)=hardlim(w*P(:,k));
        w=w+alpha*(T(:,k)-a(:,k))*P(:,k)';
        e(:,k)=T(:,k)-a(:,k);
    end
    emse=mse(e);
    error(it,:)=e;
end
wf=w(:,2:3);
bf=w(:,1);
x1=-2:0.01:2;
x2=-(wf(1)/wf(2))*x1-(1/wf(2))*bf;
plotpv(P(2:3,:),T)
hold
plot(x1,x2)
axis([-2 2 -2 2])