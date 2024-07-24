l=0.0375;
c0=3*10^(8);
bignum=100000000000000000000;
f=[0:10^(7):3*10^(9)];
Zo=[43.6,98.45,101.6];
b=2*pi.*f/c0;

Zin1=50;
Zin2=zin(l,bignum,b,Zo(2));
ZL1=parallel(Zin1,Zin2);
Zin3=zin(l,ZL1,b,Zo(3));
Zin4=zin(l,bignum,b,Zo(1));
ZL2=parallel(Zin3,Zin4);
Zin5=zin(l,ZL2,b,Zo(3));
Zin6=zin(l,bignum,b,Zo(2));
Zin=parallel(Zin5,Zin6);

G=abs((Zin-50)./(Zin+50));
SWR=(1+G)./(1-G);
G(100);
for i=[1:301]
    
   if G(i)<10^(-3)
      G(i)=10^(-3);
   end
   if SWR(i)>=10
      SWR(i)=10;
   end
   
end    

figure (1);
plot(f,G);
title('Διάγραμμα συντελεστή ανάκλασης ');
xlabel('f(Hz)');
ylabel('Γ');
ylim([0 1]);
grid on;


figure(2);
plot(f,20*log10(G));
title('Διάγραμμα συντελεστή ανάκλασης σε dB');
xlabel('f(Hz)');
ylabel('Γ(dB)');
ylim([-80 0]);
grid on;

figure(3);
plot(f,SWR);
title('Διάγραμμα συντελεστή SWR');
xlabel('f(Hz)');
ylabel('SWR');
grid on;

function Zin=zin(li,Zli,b,Zo)
Zin = Zo*(Zli+1j*Zo*tan(b*li))./(Zo+1j*Zli.*tan(b*li));
end
function Par=parallel(Z1,Z2)
Par=(Z1.*Z2)./(Z1+Z2);
end