function Y=NN_regression(Theta1,Theta2,X)
%NN_regression Calcula las salidas de la red neuronal en el caso de
%problemas de regresion
%Salidas
%Y: Salidas de la red
%Entradas
%Theta1:Matriz de parametros de la capa1
%Theta1:Matriz de parametros de la capa2
%x: Matriz de entradas
%---------------------------
%1. Configuracion inicial
%------------------
%1.1 numero de patrones
N=size(X,1);
%-------------------------------
%2. Propagamos por la primera capa
%------------------------
%2.1 Activaciones de las neuronas
A1=[ones(N,1) X]*Theta1;
% 2.2 Salidas de las neuronas
Z1=tanh(A1);
%-------------------------------------------
%3. Propagamos por la segunda capa
%3.1 Activacion es de las neuronas
A2=[ones(N,1) Z1]*Theta2;
%3.2 Las salidas son las activaciones (prediccion)
Y=A2;
end
