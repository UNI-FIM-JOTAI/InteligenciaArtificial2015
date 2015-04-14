%Demo perceptron_02 Data linealmente separable
clear all;close all;clc;
%1 definicion del conjunto de entrenamiento
%1.1 Definicion de los patrones
x1=[0 0]; t1=0;
x2=[0 1]; t2=1;
x3=[1 0]; t3=1;
x4=[1 1]; t4=1;%t4=0;
%Establecemos  la matriz de entradas
X=[x1;x2;x3;x4];
T=[t1;t2;t3;t4];
N=length(T); %numerode patrones
%1.3 ploteamos la data
plotData(X,T)
%2.2. Adicional
axis([min(X(:,1))-0.2 max(X(:,1))+0.2 min(X(:,2))-0.2  max(X(:,2))+0.2])
xlabel('x1')
ylabel('x2')
grid on
hold on
%----------------------------
%2. Configuracion inicial
%----------------------------
%2.1 Establecemos la maatriz  de entradas
% alpha=0.25;
X=[ones(N,1) X]; 

%Modificamos los targets t={1 1}
Tn=T;
Tn(Tn==0)=-1;
%----------------------------
% 3. Inicializacion de la red
%----------------------------
% 3.1 Vector de parametros inical aleatorio
%theta=rndn(3,1)
theta=[-1.2 -1.9 0.2]';%rndn(3,1)%nuemeros aleatorios gaussianos(dist.  normal media =0
%varianza=1), el bias es -1.2
% W=rand(3,1);
%3.2 Ploteamos ladata de decision
%-> Calculamos  2 puntos  de la linea generada
plot_x=[min(X(:,2))-2, max(X(:,2))+2];
plot_y=(1./theta(3)).*(-theta(1)-theta(2).*plot_x);
%-> ploteamos la data usando un handle
handle_line=plot(plot_x,plot_y,'g-','linewidth',2);
axis([-2 2 -2 2])
%--------------------------------------------------
%4.  Codigoprincipal-aprendizaje del perceptron
%--------------------------------------------------
%4.1. Definicion de parametros
alpha=1;  %Learning rate
Niter_MAX=200; %numero de iteraciones
%4.2 Lazo principal
n=1;         %Patron n
Niter=1;    %numero de iteraciones
 for i=1:Niter_MAX
     % A. mensajes
     fprintf('ITERACION: %d\n',Niter)
     fprintf('  Patron %d\n',n)
     %B. Respuesta del perceptron para el patron "n"
    % fprintf('  Patron xn: [%2.4f %2.4f, %2.4f',xn)
     xn=X(n,:);
     an=xn*theta;
     yn=sign(an);
     fprintf(' a_n:  %2.4f\n', an)
     fprintf(' y_n:  %2.4f\n', yn)
     %C. Regla de aprendizaje
     if Tn(n)==1 && yn==-1
         fprintf(' Patron mal clasificado\n')
         fprintf(' tn= 1, yn= -1\n')
         theta=theta+alpha*xn';
     elseif Tn(n)==-1 &&yn==1
         fprintf(' Patron mal clasificado\n')
         fprintf(' tn= -1, yn= 1\n')
         theta=theta-alpha*xn';
     elseif Tn(n)==yn
         fprintf(' Patron correctamente clasificado\n')
     end
         disp('theta: ')
         disp(theta')
    %set(handle_theta, 'xdata',[0 theta(2)], ydata', [0 
    %Ploteamos la nueva data de decision
    %-> Calculamos el valor dela linea en 2 puntos
    plot_y=(1./theta(3)).*(-theta(1)-theta(2).*plot_x);
    % ->ploteamos la linea
    set(handle_line, 'xdata', plot_x, 'ydata', plot_y)
    % E. Calcullamos el numero de patrones mal clasificados
    % -> Salidas del perceptron
    Y=sign(X*theta);
    % -> Numero de patrones
    E=sum(Y~=Tn);
    fprintf( 'Numero de patrones mal clasificados: %d\n', E)
    %F. Calculamos el numero de patrones mal clasificados
    if(E==0)
        fprintf(' !!!Perceptron finalizo con exito!!!\n')
        break
    end
    
    % G. Actualizacion de indices
    % -> actualizamos el siguiente patron
    e(n)=Tn(n)-yn;
    ems=norm(e);
    n=n+1;
    if(n==N+1)
        n=1;
    end
    % numero de iteraciones
    Niter=Niter+1;
    pause(0.5)
    
         %
 end

% a=X*W;   
% f=zeros(length(T),1);
% cont=0;
% 
% if a(i)<0
%     f(i)=-1;
% else
%     f(i)=1;
% end
% e(i)=T(i)-f(i);
% delt_theta=-alpha*e(i);
% theta=theta+delt_theta;
% delt_W=X(i)*alpha*e(i);
% w=w+delt_w;
% W=[b w];
% if e(i)==0
%     cont=cont+1;
% end
% if (cont>10)
%     e_modif=e((i-10):i,:);
% end
%  norm(e_modif)==0
%  epoca=floor(i/N);
 
    
