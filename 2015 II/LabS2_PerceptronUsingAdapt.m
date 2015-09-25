clc; close all; clear all;
% Aprendizaje de data Q=(P,T)^2 (2 dimensional)
P=[2  1 -2 -1
   2 -2  2  1];
T=[0 1 0 1];
% Espacio de patrones (inicial)
% grafica los puntos P
plotpv(P,T)
% Crea el perceptron
net = newp(minmax(P),1);
% se generan pesos aleatorios y bias aleatorio
wi=rand(1,2);  % Teoria de Gupta wi=[-1,1]
bi=rand(1);
% se ingresan los pesos y el bias
net.iw{1,1} = wi;
net.b{1} = bi;
%net=init(net); % Inicializa pesos y bias a valor cero
disp('pesos iniciales')
disp([net.iw{1,1}, net.b{1}])
% graficamos la linea de separacion inicial
h=plotpc(net.iw{1,1}, net.b{1});

% Aprendizaje Adapt
% simula la red neuronal 
a=sim(net,P);
e=T-a;
e=mae(e);
disp('error incial')
disp(e)

i=0;
while norm(e)>=1e-3
    % adapta la red neuronal a las entradas y targets que tiene
    [net,y,e]=adapt(net,P,T);
    i=i+1;
end
disp('Numero de IT')
disp(i)
net.adaptParam.passes=i;
[net,a,e]=adapt(net,P,T);
disp('Error')
% se muestra el error mae
disp(mae(e))
% se guardan los pesos finales y el bias final
wf=net.iw{1,1};
bf=net.b{1};
pause(3)
% se grafica la nueva linea de separacion despues del entrenamiento
plotpc(wf,bf,h)


