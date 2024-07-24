for t=1:3
Io=1;
f=1*10^9;
co=3*10^8;
lamda = co/f;
k=2*pi/lamda;
l=lamda/2;
d=[-3.5:1:3.5]*t*lamda/4;
E=0;
theta=[0:0.01:pi*2];
phi=[0:0.01:pi*2];

for i = 1:8
    E=E+(-60*j*(exp(-k*j*(-d(i)*cos(phi).*sin(theta)))).*(cos((pi/2)*cos(theta))./sin(theta)));
end
for n=1:length(theta)
    theta(n,:)=theta(1,:);
end
phi=phi';
for m=1:length(phi)
    phi(:,m)=phi(:,1);
end
for k=1:length(E)
    E(k,:)=E(1,:);
end

[x,y,z]=sph2cart(theta,phi,abs(E));
xlabel('x');
ylabel('y');
zlabel('z');
figure(t);
surf(x,y,z);
title([num2str(t),'λ/4']);

end


