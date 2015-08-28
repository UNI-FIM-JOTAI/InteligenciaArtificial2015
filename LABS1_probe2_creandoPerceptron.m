clear all; close all; clc;
% ________________________________________________________________________
% creando perceptron
% (i) analizar el aprendizaje funcion logiaca OR
% (2) validar el aprendizaje respuesta de la red
% (3) aprendizaje en el espacion de patrones
% ________________________________________________________________________

% DATA
P= [0 0 1 1
    0 1 0 1];
T= [0 1 1 1];

%% Creando perceptron
PR = minmax(P); %dim de R2 valores input 
S=1; % neuronas
TF = 'hardlim'; % funcion de activacion
LF = 'learnp';  % funcion de aprendizaje
net = newp(PR,S,TF,LF);

%% pesos pequeños (reales) arbitrarios
w=[-0.1 0.8];
b=0.7;
net.iw{1,1}=w;
net.b{1}=b;
% (3) espacio inicial de patrones
figure(1)
plotpv(P,T)
h=plotpc(net.iw{1,1}, net.b{1});
axis([-1 2 -2 2])

%% entrenamiento de la red
net=train(net,P,T);
% simulando el eror
a=sim(net,P);
% error MAE (Mean Absolute Error)
e=T-a;
emae=mae(e);
disp('Error MAE')
disp(emae)

% pesos finales del entrenamiento
wf= net.iw{1,1};
bf=net.b{1};
disp('Pesos Finales')
disp([bf wf])

%% Valida el aprendizaje, la rede debe haber entrenado previamente para el
% analisis

Pv=[0 1]';
av=sim(net,Pv);
if av==1
    disp('reconoce salida 1')
else
    disp('reconoce salida 0')
end


%% Espacio de patrones final
figure(1)
pause(2)
plotpc(wf,bf,h); % h es un handel grafico (teoria GUIDE)


%% Ejercicio : Analice el prendizaje de la funcion logica AND para datos
% bipolares. Muestre sus resultados en forma analitica (validar) y en un
% grafico, pesos iniciales de valor aleatorio, use comando "rand"
% Datos :
% P = [1 -1 -1 1
%      1 1 -1 -1]
% T = [-1 -1 -1 1]
