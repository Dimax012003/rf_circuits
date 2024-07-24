l=[0.01815,0.0261,0.03143,0.0261,0.01815];
c0=3*10^(8);
bignum=100000000000000000000;
f=[0:10^(7):3*10^(9)];
Zo=[150,20,150,20,150];
b=2*pi.*f/c0;
Zin=50;
for i=[1:5]
    Zin=zin(l(i),Zin,b,Zo(i));
end

G=abs((Zin-50)./(Zin+50));
SWR=(1+G)./(1-G);

for i=[1:301]
    
   if G(i)<10^(-3)
      G(i)=10^(-3);
   end
   if SWR(i)>=10
      SWR(i)=10;
   end
   
end   

figure (5);
plot(f,G);
title('Διάγραμμα συντελεστή ανάκλασης ');
xlabel('f(Hz)');
ylabel('Γ');
ylim([0 1]);
grid on;


figure(6);
plot(f,20*log10(G));
title('Διάγραμμα συντελεστή ανάκλασης σε dB');
xlabel('f(Hz)');
ylabel('Γ(dB)');
ylim([-80 0]);
grid on;


figure(7);
plot(f,SWR);
title('Διάγραμμα συντελεστή SWR');
xlabel('f(Hz)');
ylabel('SWR');
grid on;

function Zin=zin(li,Zli,b,Zo)
Zin = Zo*(Zli+1j*Zo*tan(b*li))./(Zo+1j*Zli.*tan(b*li));
end