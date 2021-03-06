clear all; close all; clc
% modelo neuronal (PDF MAtLAB 2014a, pag 340)
% caso R=2
% en el problema los datos son arbitrarios

p = [1 0]'; % vector paralelo input
w = [0.1 1]; % vector de pesos sinapticos
b = -0.2; % bias (peso umbral)
n=w*p+b; % nivel de activacion
a=purelin(n);
disp('activacion');
disp(n);
disp('salida');
disp(a);
T=1; % salida objetivo (target)
e=T-a; %error
disp('error');
disp(e);
