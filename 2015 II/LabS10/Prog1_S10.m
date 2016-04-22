clear all, close all, clc;
x=-1:0.1:1;
y=x.^2;
subplot(221),plot(x,y)
%asumir particion difusa del universo 0.5
a=newfis('parabola','mamdani');
a=addvar(a,'input','X',[-1 1]);
a=addmf(a,'input',1,'mf1','trimf',[-1 -1 -0.5]);
a=addmf(a,'input',1,'mf2','trimf',[-1 -0.5 0]);
a=addmf(a,'input',1,'mf3','trimf',[-0.5 0 0.5]);
a=addmf(a,'input',1,'mf4','trimf',[0 0.5 1]);
a=addmf(a,'input',1,'mf5','trimf',[0.5 1 1]);
subplot(223), plotmf(a,'input',1)

% Se seleccionan 3 MFs output (proyeccion)


a=addvar(a,'output','Y',[0 1]);
a=addmf(a,'output',1,'mf1','trimf',[0 0 0.01]);
a=addmf(a,'output',1,'mf2','trimf',[0.24 0.25 0.26]);
a=addmf(a,'output',1,'mf3','trimf',[0.99 1 1]);
subplot(222), plotmf(a,'output',1)


% Regla Base del Conocimiento
BR = [1 3 1 1
      2 2 1 1
      3 1 1 1
      4 2 1 1
      5 3 1 1];
a=addrule(a,BR);
a=writefis(a,'parab1');

% Lectura del FIS (Fuzzy Inference System)
b=readfis('parab1');
surfview(b)


