% Demo_NN_07: Regression usando redes neuronales
% Autor: Ivan A. Calle Flores
clear ; close all; clc

%----------------------------------------------------------------------%
% 1. CONJUNTO DE ENTRENAMIENTO
%----------------------------------------------------------------------%
N = 50;
X = linspace(0,1,N)';
sigma = 0.1;
T = sin(2*pi*X) + sigma*randn(N,1);
plot(X,T,'or')
hold on
fplot('sin(2*pi*x)', [0 1],'g')



%----------------------------------------------------------------------%
% 2. DEFINICION DE LOS PARAMETROS DE LA RED NEURONAL
%----------------------------------------------------------------------%
%  2.1. DIMENSION DE LA RED
Number_in = size(X,2);
Number_hidden = 3;
Number_out = 1;

%  2.2. MATRIZ DE PESOS DE LA PRIMERA CAPA
Theta1 = 0.1*randn(Number_in+1, Number_hidden);

%  2.2. MATRIZ DE PESOS DE LA SEGUNDA CAPA
Theta2 = 0.1*randn(Number_hidden+1, Number_out);

%  2.4. VECTOR DE PARAMETROS TOTAL
NN_params = [Theta1(:); Theta2(:)];


                        
%----------------------------------------------------------------------%
% 3. ENTRENAMIENTO DE LA RED NEURONAL
%----------------------------------------------------------------------%
%  3.1. CONSTRUIMOS UN HANDLE A LA FUNCION DE ERROR
costFunc = @(p)NN_Error_Regression(p, Number_in, Number_hidden,...                          
    Number_out, X, T);

%  3.2. ESTABLECEMOS EL VECTOR DE OPCIONES DE OPTIMIZACION
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  3.3. EJECUTAMOS LA FUNCION "fminunc" PARA OBTENER "theta"
[theta_star, J, exit_flag] = fminunc(costFunc, NN_params, options);

%  3.4. OBTENIENDO LOS PESOS DE LAS CAPAS
%   -> De la primera capa
Theta1 = reshape(theta_star(1:(Number_in + 1)*Number_hidden),...
    (Number_in + 1), Number_hidden);
%   -> De la segunda capa
Theta2 = reshape(theta_star((Number_in + 1)*Number_hidden + 1:end),...
 (Number_hidden + 1), Number_out);  



%----------------------------------------------------------------------%
% 4. PLOTEAMOS EL MODELO ENTRENADO
%----------------------------------------------------------------------%
X_test = linspace(0, 1, 100)';
Y = NN_regression(Theta1, Theta2, X_test);
plot(X_test, Y,'b-')
hold on
