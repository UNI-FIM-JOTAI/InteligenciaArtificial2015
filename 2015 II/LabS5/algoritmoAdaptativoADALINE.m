N = length(t);
p = 2;
b = [1 0.1];
X = convmtx(xt,p);
X = X(:,1:N);
y = zeros(size(d));
e = zeros(size(d));
w = rand(1,p);
alpha = 0.05;
for n = 1:N
    y(n) = w*X(:,n);
    e(n) = d(n) - y(n);
    w = w + 2*alpha*e(n)*X(:,n)';
    if n == N-1
       w1 = w; 
    end
end