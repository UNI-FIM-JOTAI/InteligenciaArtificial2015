% Demo_NN_04: Programacion de datos por la red - clasificacion
% Autor: Ivan A. Calle Flores
%Descripcion: Red neuronal de 2 entrada, 3 unidades escondidas y 1 salidas
clc; clear all; close all

%% 1.- DEFINICION DE LAS ENTRADAS
% 1.1 CARGAMOS EL CONJUNTO DE ENTRENAMIENTO
data = load('data_2c_01.txt');
% 1.2 ESTABLECEMOS LA MATRIZ DE ENTRADA Y DE TARGETS
X = data(:, [1,2]);
T = data(:, 3);
N = length(T);
% 1.3 PLOTEAMOS LA ENTRADA
plotData(X,T);

%% 2.- DEFINICION DE LOS PARAMETROS DE LA RED
% 2.1 DEFINICION DE LOS "PESOS" DE LA PRIMERA CAPA
Theta1_1 = [0.2 0.4 0.5]';     %1ra unidad escondida
Theta1_2 = [-0.1 0.3 1.6]';      %2da unidad escondida
Theta1_3 = [0.1 0.5 0.5]';     %3ra unidad escondida

% -> Matriz de parametros
Theta1 = [Theta1_1 Theta1_2 Theta1_3];

% 2.2 DEFINICION DE LOS "PESOS" DE LA SEGUNDA CAPA
% -> Pesos de cada unidad escondida
Theta2_1 = [0.2 -0.4 0.5 1.0]';  % de la 1ra salida

% ->Matriz de parametros
Theta2 = Theta2_1;

%% 3.- CALCULO DE LAS SALIDAS DE LA RED
% 3.1 LLAMAMOS A LA FUNCION QUE IMPLEMENTA LA RED
Y = NN_clasification(Theta1, Theta2, X);
% 3.2 PLOTEAMOS EL RESULTADO
disp('Salida de la red');
disp(Y)

%% 4. PLOTEAMOS EL MODELO ENTRENADO
%  4.1. DEFINICION DE LAS ENTRADAS
x1 = linspace(min(X(:,1))-1.0, max(X(:,1))+1.0, 30);
x2 = linspace(min(X(:,2))-1.0, max(X(:,2))+1.0, 30);
[X1,X2] = meshgrid(x1,x2);
X = [reshape(X1, numel(X1),1)  reshape(X2, numel(X2),1) ];
N = size(X,1);
%  4.2. SALIDAS DEL SISTEMA
Y = NN_clasification(Theta1, Theta2, X);
YY = reshape(Y, size(X1));
contour(X1,X2,YY,[0.1 0.3 0.5 0.7 0.9])
%  4.3. PLOTEAMOS LA SUPERFICIE
figure 
surf(X1,X2,YY)
colorbar
xlabel('x1')
ylabel('x2')
zlabel('p(C1|x)')
