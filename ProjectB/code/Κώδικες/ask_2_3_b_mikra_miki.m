
c0=3*10^(8);
bignum=100000000000000000000;
f=[0:10^(7):10*10^(9)];
Zo=50;
b=2*pi.*f/c0;

Zin1=20-30j;
Zin2=zin(0.006501,bignum,b,Zo);
ZL1=parallel(Zin1,Zin2);
Zin3=zin(0.0075,ZL1,b,Zo);
Zin4=zin(0.01102,bignum,b,Zo);
ZL2=parallel(Zin3,Zin4);

Zin=ZL2;

G=abs((Zin-50)./(Zin+50));
SWR=(1+G)./(1-G);
G(100);
for i=[1:length(f)]
    
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
