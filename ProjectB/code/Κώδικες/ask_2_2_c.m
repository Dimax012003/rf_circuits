for i=1:3
Pmax=305.5774;
volume=0;
for x=0:0.01:pi*2
    area=0;
    for y=0.01:0.01:pi
        area=area+p(y,x,i)*sin(y)*0.01;
    end
    volume=volume+area*0.01;
   
end
D=4*pi*Pmax/volume;
disp(['Υπολογισμός με ολοκλήρωση ','D',num2str(i),'=',num2str(D)]);
disp(['Θεωρητικός υπολογισμός ','D',num2str(i),'=',num2str(2^(i+1))]);
end
function P=p(theta,phi,t)

Io=1;
f=1*10^9;
co=3*10^8;
lamda = co/f;
k=2*pi/lamda;
l=lamda/2;
d=[-3.5:1:3.5]*t*lamda/4;
E=0;

for i = 1:8
    E=E+(60*j*(exp(-k*j*(-d(i)*cos(phi)*sin(theta)))).*(cos((pi/2)*cos(theta))./sin(theta)));
end
P=abs(E).^(2)/(240*pi);

end