Io=1;
f=1*10^9;
co=3*10^8;
lamda = co/f;
k=2*pi/lamda;
l=lamda/2;

hx=3*lamda/(2*sqrt(2));
hy=3*lamda/(2*sqrt(2));

theta=[pi/2];
phi=[0:0.001:pi/2];


E=(60j*(exp(-k*j*(-hx.*cos(phi).*sin(theta)-hy.*sin(phi).*sin(theta)))) +60j*exp(-k*j*(hx*cos(phi).*sin(theta)+hy*sin(phi).*sin(theta)))-60j*exp(-k*j*(-hx*cos(phi).*sin(theta)+hy*sin(phi).*sin(theta)))-60j*exp(-k*j*(hx*cos(phi).*sin(theta)-hy*sin(phi).*sin(theta)))).*(cos((pi/2)*cos(theta))./sin(theta));

polarplot(phi,abs(E));