%% ------------------------------------------------------------------------
clc; clear all;close all
% Modelo de la Planta
%      b1 s + b2
%   ----------------
%   s^2 + a1 s + a2

% Planta 1 - Sobreamortiguada
b1=0;
b2=1/4.84e-6;
a1=0.0044/4.84e-6;
a2=1/4.84e-6;

%% Parametros para el diseño del controlador PID
T=0.001;
tfin=0.5;
t=0:T:tfin;
zi=0.7;
w0=225;
alpha=0.8;
wn=w0;
wd=wn*(1-zi^2)^0.5;

%% Diseño del Controlador PID

Gp=tf([b1 b2],[1 a1 a2])
%step((Gp/(Gp+1)),t) % respuesta sin controlar

Kp=(a2*b2^2-a2*b1*b2*(alpha+2*zi)*w0-(b2-a1*b1)*(b2*(1+2*alpha*zi)*w0^2-alpha*b1*w0^3))/(b2^3-b1*b2^2*(alpha+2*zi)*w0+b1^2*b2*(1+2*alpha*zi)*w0^2-alpha*b1^3*w0^3);
Ki=((-alpha*b1*b2+a2*b1^2+b2^2)*alpha*w0^3)/(b2^3-b1*b2^2*(alpha+2*zi)*w0+b1^2*b2*(1+2*alpha*zi)*w0-alpha*b1^3*w0^3);
Kd=(-a1*b2^2+a2*b1*b2+b2^2*(alpha+2*zi)*w0-b1*b2*w0^2*(1+2*alpha*zi)+b1^2*alpha*w0^3)/(b2^3-b1*b2^2*(alpha+2*2*zi)*w0+b1^2*b2*(1+2*alpha*zi)*w0^2-alpha*b1^3*w0^3);

Gc=tf([Kd Kp Ki],[1 0])    % Controlador en tiempo continuo
step(Gp);
hold on
step((Gp*Gc/(1+Gp*Gc)),t)   % respuesta controlada en tiempo continuo
legend('G_{sin controlar}','G_{controlado continuo}')

%% Controlador PID en tiempo Discreto

%     2(z-1)
% s= --------
%     T(z+1)

figure
[n1,d1]=tfdata(Gc,'v');
n1=poly2sym(n1);
d1=poly2sym(d1);
%syms s kp ki kd
syms z s
c=n1/d1;

%c=subs(c,{'kp','kd','ki'},[1,0,1,0.02]);
c=subs(c,'x',(2/T)*(z-1)/(z+1));
[nc,dc]=numden(c);

nc=sym2poly(nc);
dc=sym2poly(dc);
Cz=tf(nc,dc,T) % Función de transferencia del controlador discreto

%%  Realizando el Control en tiempo Discreto
[nx,dx]=tfdata(Cz,'v');
datos=[nx dx];
save coef.lvm datos -ascii -tabs
Gpz=c2d(Gp,T,'tustin') % Planta en tiempo discreto
hold 
tk=0:T:tfin;       
N=length(tk);
[n,d]=tfdata(Gpz,'v'); % Muestra los coeficientes del numerador y denominador
dstep(n,d,N)           % gráfica de la respuesta en tiempo discreto
G=Gpz*Cz/(1+Gpz*Cz);   % Planta con el controlador
[num,den]=tfdata(G,'v');
dstep(num,den,N);
legend('G_{disc sin controlar}','G_{disc controlado}')
PID_1=[Kp Ki Kd]