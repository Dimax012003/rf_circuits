function F=roots(x)
Zin=4.9678+43.9439*j;
Zo=120*pi/(sqrt(1-(6.56/10)^2));
co=3*10^8;
f=10^10;
b=(2*pi*f/co)*(sqrt(1-(6.56/10)^2));
L=0.06;
d=1.5*10^(-3);
Zin1 = (Zin*Zo-j*Zo*Zo*tan(b*(L-d)))/(Zo-Zin*j*tan(b*(L-d)));
be=(2*pi*f/(co))*sqrt(abs(x(1))-0.430336);
k=4*pi*pi*f*f*abs(x(1))/(co^2);
F=Zin1-(120*pi/(sqrt(abs(x(1))-0.430336)))*tanh(d*((k*abs(x(2))/(2*be))+be*j));
end
