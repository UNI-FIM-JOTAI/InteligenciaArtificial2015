function plotData(X,T,marco)
    
    N = length(T);
    grid on
    hold on
    for i=1:N
        if ((T(i)==-1)|(T(i)==0))
            plot(X(i,1),X(i,2),'gx','MarkerSize',10,'LineWidth',2);
        elseif (T(i)==1)
            plot(X(i,1),X(i,2),'bo','MarkerSize',10,'LineWidth',2);
        end
    end
    axis([min(X(:,1))-marco max(X(:,1))+marco min(X(:,2))-marco max(X(:,2))+marco ])
    xlabel('x1');
    ylabel('x2');
end
