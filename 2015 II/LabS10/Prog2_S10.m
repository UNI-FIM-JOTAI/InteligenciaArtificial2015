clear all, close all, clc

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

% Consecuente Sugeno
% Se seleccionan 3 MFs output (proyeccion)
a=addvar(a,'output','Y',[0 1]);
a=addmf(a,'output',1,'mf1','constant',0);
a=addmf(a,'output',1,'mf2','constant',0.25);
a=addmf(a,'output',1,'mf3','constant',1);
subplot(222), hold
plot([0 0],[0 1],'r','LineWidth',3)
plot([0.25 0.25],[0 1],'r','LineWidth',3)
plot([1 1],[0 1],'r','LineWidth',3)


% Regla Base del Conocimiento
a=parsrule(a,char(...
    'if X is mf1 then Y is mf3',...
    'if X is mf2 then Y is mf2',...
    'if X is mf3 then Y is mf1',...
    'if X is mf4 then Y is mf2',...
    'if X is mf5 then Y is mf3',...
    )
a=addrule(a,BR);
a=writefis(a,'parab2');

% Lectura del FIS (Fuzzy Inference System)
b=readfis('parab2');
surfview(b)


