fun=@roots;
x0=[4.4790,0.0527];
x = fsolve(fun,x0);
disp(['tand =',num2str(x(2))]);
disp(['εr =',num2str(x(1))]);
