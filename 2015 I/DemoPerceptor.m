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

plotData(X,T,1);
