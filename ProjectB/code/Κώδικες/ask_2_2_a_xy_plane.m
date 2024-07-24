for t=1:3
Io=1;
f=1*10^9;
co=3*10^8;
lamda = co/f;
k=2*pi/lamda;
l=lamda/2;

d=[-3.5:1:3.5]*t*lamda/4;
E=0;
theta=[pi/2];
phi=[0.01:0.001:2*pi];

for i = 1:8
    E=E+(60*j*(exp(-k*j*(-d(i)*cos(phi).*sin(theta)))).*(cos((pi/2)*cos(theta))./sin(theta)));
end
figure(t);
polarplot(phi,abs(E));
title([num2str(t),'λ/4']);
U=E.^2;
disp(max(abs(U/(240*pi))))
end