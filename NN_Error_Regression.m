function [E grad] = NN_Error_Regression(NN_params, Number_in,...
    Number_hidden,Number_out, X, T)
% NN_Error_Regression Implementa la funcion de error de la red neuronal
%                     en el problema de regression
% 
% 
% SALIDAS
%      E: Error de la red bajo los parametros "NN_params"
%   grad: Gradiente de la funcion de error
%
% ENTRADAS
%      NN_params: Vector de parametros
%      Number_in: Numero de entradas
%  Number_hidden: Numero de unidades escondidas
%     Number_out: Numero de salidas


%% 1. CONFIGURACION INICIAL
%  1.1. NUMERO DE PATRONES
N = size(X, 1);

%  1.2. OBTENIENDO LOS PARAMETROS
%   -> Matriz "Theta1"
Theta1 = reshape(NN_params(1:(Number_in + 1)*Number_hidden),...
    (Number_in + 1), Number_hidden);
%   -> Matriz "Theta2"
Theta2 = reshape(NN_params((Number_in + 1)*Number_hidden + 1:end),...
 (Number_hidden + 1), Number_out);

%% CALCULO DEL ERROR
%2.1 SALIDA DE LA RED
Y = NN_regression(Theta1, Theta2; x);

% 2.2 Error cuadratico
E = (Y-T).^2;
E = 1/2*sum(sum(E));

grad = 0;
end
