% Conjunto difuso
clear all, close all, clc
X=0:0.01:10;    % Universo de discurso
c=[1 3 5];      % Control
% se puede utilizar el trimf trapmf gaussmf - se puede buscar en MatWorks
A=trimf(X,c);
% y/o Fch de Membresia
plot(X,A)
text(2.8,1.05,'\bf A')  % A var linguistica
xlabel('X')
ylabel('\mu_X')
title('A --> Conjunto Difuso')
axis([0 10 0 1.2])

% Elemento crisp
x0=4;
A0=trimf(x0,c);
hold
plot([x0 x0],[0 A0],'r:','LineWidth',2)
plot([0 x0],[A0 A0],'r:','LineWidth',2)
title(['A = ','(',num2str(x0),','...
    num2str(A0),')'])
