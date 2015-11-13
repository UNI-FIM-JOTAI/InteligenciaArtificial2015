
%Obteniendo la data
x = 0:0.05:2;
y = humps(x);
P = x;
T = y;
plot(P,T,'x')
grid; xlabel('time (s)'); ylabel('output'); title('humps function');

%% Disenando la Red Neuronal

net=newff([0 2], [5,1], {'tansig','purelin'},'traingd');

net.trainParam.show = 50; 
net.trainParam.lr = 0.05; 
net.trainParam.epochs =1000; 
net.trainParam.goal = 1e-3; 

net1 = train(net, P, T);
a= sim(net1,P);

% verificando el entrenamiendo
plot(P,a-T, P,T); 
grid;
% El error es muy alto

%% Usamos 20 nodos para mejorar el aprendizaje

net=newff([0 2], [20,1], {'tansig','purelin'},'traingd');

net.trainParam.show = 50; 
net.trainParam.lr = 0.05; 
net.trainParam.epochs =1000;
net.trainParam.goal = 1e-3; 

net1 = train(net, P, T);
% El error disminuye muy significativamente

%% Usando un numero mas reducido de nodos / 10
net=newff([0 2], [10,1], {'tansig','purelin'},'traingd');

net.trainParam.show = 50; 
net.trainParam.lr = 0.05; 
net.trainParam.epochs =1000;
net.trainParam.goal = 1e-3;

net1 = train(net, P, T);

%El error es el tolerado
a= sim(net1,P);
% verificando el entrenamiendo
plot(P,a-T, P,T); 
grid;
xlabel('Time (s)'); ylabel('Output of network and error'); title('Humps function') 


%% Redes de funciones de base radial

% forma de la funcion
p = -3:.1:3;
a = radbas(p);
plot(p,a) 

x = 0:.05:2; y=humps(x);
P=x; T=y;

net1 = newrb(P,T); 
a= sim(net1,P);
plot(P,T-a,P,T)

%variando los parametros de Error cuadratico medio objetivo y
% propagacion de la funcion de base radial

goal=0.02; spread= 0.1;
net1 = newrb(P,T,goal,spread); 

a= sim(net1,P);
plot(P,T-a,P,T)
xlabel('Time (s)'); ylabel('Output of network and error');
title('Humps function approximation - radial basis function') 







