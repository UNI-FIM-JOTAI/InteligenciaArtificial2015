clear all; close all; clc
% NEWFIS = Nuevo FIS (Fuzzy Inference System)
% Solucion del problema (asignar propina)
a= newfis ('propina', 'mamdani', 'min', 'max', ...
    'min','max', 'centroid');
% Entradas (servicio, comida)
a=addvar(a,'input','servicio', [0 10]);
a=addmf(a,'input',1,'pesimo', 'gaussmf', [1.5 0]);
a=addmf(a,'input',1,'bueno', 'gaussmf', [1.5 5]);
a=addmf(a,'input',1,'excelente', 'gaussmf', [1.5 10]);

a=addvar(a,'input','comida', [0 10]);
a=addmf(a,'input',2,'rancia', 'trapmf', [0 0 1 3]);
a=addmf(a,'input',2,'deliciosa', 'trapmf', [7 9 10 10]);

% Salida
a=addvar(a,'output','propina', [0 30]);
a=addmf(a,'output',1,'pobre','trimf', [0 5 10]);
a=addmf(a,'output',1,'promedio', 'trimf', [10 15 20]);
a=addmf(a,'output',1,'generosa', 'trimf', [20 25 30]);
figure
subplot(221), plotmf(a,'input',1)
subplot(222), plotmf(a,'input',2)
subplot(2,2,[3 4]),plotmf(a,'output',1)

%conocimiento a traves de la regla base
% col1 -> #input1
% col2 -> #input2
% col3 -> #output1
% col4 -> pesos(defecto 1)
% col5 -> conector logico(and=1 or=2)

BR = [1 1 1 1 2
      2 0 2 1 1
      3 2 3 1 2];
  
a = addrule(a,BR); % adiciona reglas base
% escribiendo el FIS
a=writefis(a,'propina');

%% Propiedades de objetos

% se toma el archivo propina.fis que se creo
b= readfis('propina');
b.input
b.input.name
b.input.range
b.rule
b.rule.connection

%% Propiedades del guide
%ruleview(b)
%surfview(b)
%ruleedit(b)
%mfedit(b)

%% Evaluacion del FIS ante entradas crisp

x0= 2.4;    % servicio
y0= 8.45;   % comida
z0= evalfis([x0, y0],b);
disp('Inputs'), disp([x0,y0])
disp('Outputs'), disp(z0)

%%Tarea mostrar todos los valores de las reglas de sistema difuso cuando se
% verifica la regla.

% una pista es utilizar
b.input(1).mf.params
