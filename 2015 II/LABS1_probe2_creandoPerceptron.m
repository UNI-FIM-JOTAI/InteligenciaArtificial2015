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
PR = minmax(P); %dim de R2 valores input con los valores minimos y maximos 
S=1; % numero de neuronas
TF = 'hardlim'; % funcion de transferencia (puede ser hardlim o hardlims)
LF = 'learnp';  % funcion de aprendizaje (puede ser learnp learnpn)
% Se crea un perceptron
net = newp(PR,S,TF,LF);

%% pesos pequeños (reales) arbitrarios
w = [-0.1 0.8]; % pesos iniciales arbitrarios
b = 0.7;        % bias inicial arbitrario
net.iw{1,1} = w;
net.b{1} = b;
% (3) espacio inicial de patrones
figure(1)
% grafica el vector de entrada/target del perceptron
%plotpv(P,T)
plotData(P',T',1);
% grafica la linea de clasificacion de un perceptron
h=plotpc(net.iw{1,1}, net.b{1});
% establece los limites en X y Y de la grafica
%axis([-1 2 -2 2])

%% entrenamiento de la red
% entrena la red neuronal utilizando el input P y los target T
net=train(net,P,T);
% simulando el error
% sim simula la red neuronal, utilizando en net y la entrada que quiere
% simularse, obteniendose la salida de la red neuronal
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

% entrada de validacion
Pv=[0 1]';
% simulacion de la red neuronal
av=sim(net,Pv);
if av==1
    disp('reconoce salida 1')
else
    disp('reconoce salida 0')
end


%% Espacio de patrones final
figure(1)
pause(2)
plotpc(wf,bf,h); % h es un handel grafico (teoria GUIDE), h mueve la ultima linea graficada


%% Ejercicio : Analice el prendizaje de la funcion logica AND para datos
% bipolares. Muestre sus resultados en forma analitica (validar) y en un
% grafico, pesos iniciales de valor aleatorio, use comando "rand"
% Datos :
% P = [1 -1 -1 1
%      1 1 -1 -1]
% T = [-1 -1 -1 1]
% plotear el error MAE
