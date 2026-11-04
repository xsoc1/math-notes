rng default
A=rand(400,400)+5e2*eye(400);
x=rand(400,1);          
b=A*x;  
M=tril(A);				%M为下三角矩阵(含对角元)
N = M-A;					%N为不含对角元的上三角部分
B = zeros(400); f = zeros(400,1);
for i = 1:400           %该循环计算B = M\N,f = M\b
    f(i) = (b(i) - M(i,1:i-1)*f(1:i-1))/M(i,i);
    B(i,:) = (N(i,:) - M(i,1:i-1)*B(1:i-1,:))/M(i,i);
end
x_old = zeros(400,1);
err = 1e12;				%假设初始误差较大，必须要进行至少一次迭代
iter = 0;
while(err>1e-6)			%相邻两步误差小于1×〖10〗^(-6)则停止迭代
    iter = iter + 1;
    x_new = B*x_old + f;		%高斯-塞德尔迭代法的本质步骤
    err = norm(x_new-x_old);
    x_old = x_new;
end
iter
err = norm(x_new-x)