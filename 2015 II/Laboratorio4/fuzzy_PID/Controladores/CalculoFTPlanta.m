clc;
clear all;close all;
format short;

%% Funcion Transferencia de los Sistemas 
T=0.001;
t=0:T:0.05;
%entrada
u=ones(length(t),1);

%Sistema sobreamortiguado
C1=220e-9
C2=220e-9;
R1=10000;
R2=10000;
Gs1=tf(1,[C1*C2*R1*R2 C2*(R1+R2) 1])

%Sistema subamortiguado
C1=2e-6
C2=220e-9;
R1=10000;
R2=10000;
Gs2=tf(1,[C1*C2*R1*R2 C2*(R1+R2) 1])

%% Graficando Sistemas

figure()
step(Gs1)
legend('Planta Sobreamortiguada')

figure()
step(Gs2)
legend('Planta Subamortiguada')