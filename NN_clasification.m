function Y = NN_clasification(Theta1, Theta2, X)
%  NN_regression calcula las salidas de la red neuronal
%                neuronal en el caso de 
%                problemas de regresion
% SALIDAS
%    Y: Salidas de la red
% ENTRADAS
%   Theta1: matriz de parametros de la capa 1
%   Theta2: matriz de parametros de la capa 2
%        X: matriz de entradas
%--------------------------------------------
% 1. CONFIGURACION INICIAL
%--------------------------------------------
% 1.1 NUMERO DE PATRONES DE ENTRADA
      N= size(X,1);
%---------------------------------------------
% 2. PROPAGAMOS POR LA PRIMERA CAPA
%---------------------------------------------
% 2.1 ACTIVACIONES DE LAS NEURONAS
  A1 = [ones(N,1) X]*Theta1;
% 2.2 SALIDAS DE LAS NEURONAS
  Z1 = tanh(A1);
  
%---------------------------------------------
% 3. PROPAGAMOS POR LA SEGUNDA CAPA
%---------------------------------------------
% 3.1 ACTIVACIONES DE LAS NEURONAS
  A2 = [ones(N,1) Z1]*Theta2;
% 3.2 LAS SALIDAS SON LAS ACTIVACIONES (PREDICCION)
  Y = logistic_sigmoid(A2);
end

