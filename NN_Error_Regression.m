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
Y = NN_regression(Theta1, Theta2, X);

% 2.2 Error cuadratico
E = (Y-T).^2;
E = 1/2*sum(sum(E));

%grad = 0;

%% 3. CALCULO DEL GRADIENTE

Theta1_grad = zeros(Number_in+1, Number_hidden);
Theta2_grad = zeros(Number_hidden+1, Number_out);

for n = 1:N
   % PASO1: Propagamos en patron xn por la red
   % A. Obtenemos el patron xn
   xn = X(n,:);
   % B. Propagamos por la primera capa
   % Activaciones
   A1 =[1 xn]*Theta1;   % [1xNumber_hidden]
   % Salidas
   Z1 = tanh(A1);       % [1xNumber_hidden]
   % C. Propagamos por la segunda capa
   % Activaciones
   A2 = [1 Z1]*Theta2;  % [1xNumber_out]
   % Salidas
   Y2 = A2;             % [1xNumber_out]
   
   % PASO2: Calculamos los deltas de la salidas
   delta_2 = Y2 - T(n,:);
   
   % PASO3: Calculamos los deltas de las unidades escondidas
   delta_1 = delta_2*(Theta2(2:end,:)');    
   delta_1 = (1-Z1.^2).*delta_1;
   
   %PASO4: Calculamos los gradientes
   %4.1.- Gradiente de la segunda capa
   grad_2 = [1 Z1]'*delta_2;
   %4.2.- Gradiente de la primera capa
   grad_1 = [1 xn]'*delta_1;
   %4.3.- Acumulamos los gradientes
   Theta2_grad = Theta2_grad + grad_2;
   Theta1_grad = Theta1_grad + grad_1;

end

% Devolvemos el vector de gradientes
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
