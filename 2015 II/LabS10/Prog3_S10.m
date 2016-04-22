clear all, close all, clc;

subplot(221),fplot(@humps,[0,1]);
%asumir particion difusa del universo 0.5
a=newfis('parabola','mamdani');
a=addvar(a,'input','X',[0 1]);
a=addmf(a,'input',1,'mf1','trimf',[0 0 0.15]);
a=addmf(a,'input',1,'mf2','trimf',[0 0.3 0.637]);
a=addmf(a,'input',1,'mf3','trimf',[0.3 0.637 0.8927]);
a=addmf(a,'input',1,'mf4','trimf',[0.637 0.8927 1]);
a=addmf(a,'input',1,'mf5','trimf',[0.8927 1 1]);
subplot(223), plotmf(a,'input',1)

% Se seleccionan 3 MFs output (proyeccion)


a=addvar(a,'output','Y',[0 1]);
a=addmf(a,'output',1,'mf1','trimf',[0.04 0.05 0.06]);
a=addmf(a,'output',1,'mf2','trimf',[0.95 0.97 0.98]);
a=addmf(a,'output',1,'mf3','trimf',[0.10 0.11 0.12]);
a=addmf(a,'output',1,'mf4','trimf',[0.21 0.22 0.23]);
a=addmf(a,'output',1,'mf5','trimf',[0.15 0.16 0.17]);
subplot(222), plotmf(a,'output',1)


% Regla Base del Conocimiento
BR = [1 1 1 1
      2 2 1 1
      3 3 1 1
      4 4 1 1
      5 5 1 1];
a=addrule(a,BR);
a=writefis(a,'parab1');

% Lectura del FIS (Fuzzy Inference System)
b=readfis('parab1');
surfview(b)


