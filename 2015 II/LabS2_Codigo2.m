clc; close all; clear all;
% Aprendizaje de data Q=(P,T)^2 (2 dimensional)
P=[1  1  1  1
   2  1 -2 -1
   2 -2  2  1];
T=[0 1 0 1];
% Pesos iniciales
w=rand(1,3);
% Espacio de patrones (inicial)
plotpv(P(2:3,:),T)
h=plotpc(w(1,1:2),w(1,3));
nepoc=0;
y=hardlim(w*P);
while any(y~=T)
    y=hardlim(w*P);
    e=T-y;
    dw=learnp([],P,[],[],[],[],e,[],[],[],[],[]);
    % la celda [] no es usada
    w=w+dw; % regla update del algoritmo
    nepoc=nepoc+1;
    disp('numero de epocas')
    disp(nepoc)
    disp('error')
    disp(mae(e))
end
pause(3)
plotpc(w(1,2:3),w(1,1),h)