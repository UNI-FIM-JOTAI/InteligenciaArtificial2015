% Demo perceptron 01: ploteo de data
clear all; close all; clc

%-----------------------------------------
%% DEFINICION DEL CONJUNTO DEL ENTRENAMIENTO

% Definicion de los patrones
x1 = [0 0]; t1 = 0;
x2 = [0 1]; t2 = 0;
x3 = [1 0]; t3 = 1;
x4 = [1 1]; t4 = 0;

% Establecimiento de la matriz de entrenamiento
X=[x1;x2;x3;x4];
T=[t1;t2;t3;t4];
N = length(T);
grid on
hold on
for i=1:N
    if (T(i)==0)
        plot(X(i,1),X(i,2),'gx','MarkerSize',10,'LineWidth',2);
    elseif (T(i)==1)
        plot(X(i,1),X(i,2),'bo','MarkerSize',10,'LineWidth',2);
    end
end

axis([-2 2 -2 2]);
