% Demo_NN_03: Programacion de datos por la red - regresion
% Autor: Ivan A. Calle Flores
%Descripcion: Red neuronal de 1 entrada, 3 unidades escondidas y 2 salidas
clc; clear all; close all

%% 1.- DEFINICION DE LAS ENTRADAS
% 1.1 MATRIZ ENTRADAS
X = linspace(-3, 3, 50)';
% 1.2 NUMERO DE PATRONES DE ENTRADA
N = size(X,1);

%% 2.- DEFINICION DE LOS PARAMETROS DE LA RED
% 2.1 DEFINICION DE LOS "PESOS" DE LA PRIMERA CAPA
Theta1_1 = [-0.2 0.4]';     %1ra unidad escondida
Theta1_2 = [0.1 0.3]';      %2da unidad escondida
Theta1_3 = [-0.1 0.5]';     %3ra unidad escondida

% -> Matriz de parametros
Theta1 = [Theta1_1 Theta1_2 Theta1_3];
% 2.2 DEFINICION DE LOS "PESOS" DE LA SEGUNDA CAPA
% -> Pesos de cada unidad escondida
Theta2_1 = [0.2 0.4 0.5 1.0]';  % de la 1ra salida
Theta2_2 = [0.1 0.3 0.5 0.5]';  % de la 2da salida

% ->Matriz de parametros
Theta2 = [Theta2_1 Theta2_2];

%% 3.- CALCULO DE LAS SALIDAS DE LA RED
% 3.1 LLAMAMOS A LA FUNCION QUE IMPLEMENTA LA RED
Y = NN_regression(Theta1, Theta2, X);
% 3.2 PLOTEAMOS EL RESULTADO
disp('Salida de la red');
disp(Y)
plot(X,Y)

%% Error
Number_in = size(X,2);
Number_hidden = size(Theta2,1)-1;
Number_out = size(Theta2,2);
T = [ones(N,1) ones(N,1)];
NN_params = [Theta1(:); Theta2(:)];
[E grad] = NN_Error_Regression(NN_params, Number_in,...
    Number_hidden,Number_out, X, T);
