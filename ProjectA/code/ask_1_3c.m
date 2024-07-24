l=[0.039,0.0468,0.012,0.03];
c0=3*10^(8);
C=[2.89*10^(-12),10.61*10^(-12),3.5017*10^(-12),4.32*10^(-12)];
f=[0:0.5*10^(7):2*10^(9)];
Zo=50;
b=2*pi.*f/c0;
ZL=10+15j;
Zg=50-40j;


Xc1=-1j./(C(1)*2*pi*f);
Zin1=zin(l(1),ZL,b,Zo);
Zin1=Zin1+Xc1;

Xc2=-1j./(C(2)*2*pi*f);
Zin2=zin(l(2),ZL+Xc2,b,Zo);

Xc3=-1j./(C(3)*2*pi*f);
Zin3=zin(l(3),ZL,b,Zo);
Zin3=parallel(Zin3,Xc3);

Xc4=-1j./(C(4)*2*pi*f);
Zin4=zin(l(4),parallel(ZL,Xc4),b,Zo);

Pin1=real((abs(Zin1./(Zg+Zin1))).^(2)./(conj(Zin1)));
Pin2=real((abs(Zin2./(Zg+Zin2))).^(2)./(conj(Zin2)));
Pin3=real((abs(Zin3./(Zg+Zin3))).^(2)./(conj(Zin3)));
Pin4=real((abs(Zin4./(Zg+Zin4))).^(2)./(conj(Zin4)));

figure(3);

plot(f,Pin1,f,Pin2,f,Pin3,f,Pin4);
grid on;
legend('Σειρά στη είσοδο',' Σε σειρα στο φορτιο','Παράλληλα στην είσοδο','Παράλληλα στο φορτίο')
title('Διάγραμμα ισχυος στο φορτιο');
xlabel('f(Hz)');
ylabel('P(W)');



function Zin=zin(li,Zli,b,Zo)
Zin = Zo*(Zli+1j*Zo*tan(b*li))./(Zo+1j*Zli.*tan(b*li));
end
function Par=parallel(Z1,Z2)
Par=(Z1.*Z2)./(Z1+Z2);
end