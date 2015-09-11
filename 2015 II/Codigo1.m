clc; close all; clear all;
% Aprendizaje de data Q=(P,T)^2 (2 dimensional)
P=[2  1 -2 -1
   2 -2  2  1];
T=[0 1 0 1];
% Espacio de patrones (inicial)
plotpv(P,T)
% Crea el perceptron
net = newp(minmax(P),1);
wi=rand(1,2);  % Teoria de Gupta wi=[-1,1]
bi=rand(1);
net.iw{1,1} = wi;
net.b{1} = bi;
%net=init(net); % Inicializa pesos y bias a valor cero
disp('pesos iniciales')
disp([net.iw{1,1}, net.b{1}])
h=plotpc(net.iw{1,1}, net.b{1});

% Aprendizaje Adapt
a=sim(net,P);
e=T-a;
e=mae(e);
disp('error incial')
disp(e)

i=0;
while norm(e)>=1e-3
    [net,y,e]=adapt(net,P,T);
    i=i+1;
end
disp('Numero de IT')
disp(i)
net.adaptParam.passes=i;
[net,a,e]=adapt(net,P,T);
disp('Error')
disp(mae(e))
wf=net.iw{1,1};
bf=net.b{1};
pause(3)
plotpc(wf,bf,h)

