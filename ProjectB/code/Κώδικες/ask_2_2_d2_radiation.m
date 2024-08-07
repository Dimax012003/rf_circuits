Io=1;
f=1*10^9;
co=3*10^8;
lamda = co/f;
k=2*pi/lamda;
l=lamda/2;

hx=lamda/(2*sqrt(2));
hy=3*lamda/(2*sqrt(2));

theta=[0:0.01:pi/2];
phi=[0:0.01:pi/2];



E=(60j*(exp(-k*j*(-hx.*cos(phi).*sin(theta)-hy.*sin(phi).*sin(theta)))) +60j*exp(-k*j*(hx*cos(phi).*sin(theta)+hy*sin(phi).*sin(theta)))-60j*exp(-k*j*(-hx*cos(phi).*sin(theta)+hy*sin(phi).*sin(theta)))-60j*exp(-k*j*(hx*cos(phi).*sin(theta)-hy*sin(phi).*sin(theta)))).*(cos((pi/2)*cos(theta))./sin(theta));

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
surf(x,y,z)