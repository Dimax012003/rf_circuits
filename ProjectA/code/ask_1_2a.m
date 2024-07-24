%Αρχικοποίηση παραμέτρων
Zo=50;

bignum=100000000000000000000; %οριζω εναν μεγαλο αριθμο απειρο για να βρω προσεγγιστικα τον Ζin του κλαδωτη
ZL=100;
c0=3*10^(8);
f=[0:2*10^(7):4*10^(9)];
l=[0.096,0.072,0.03];
b=2*pi*f/c0;
C=2*10^(-12);

%Υπολογιζω τις συνθετες αντιστασεις εισοδου με την βοηθεια της zin function
%που ορισμα παρακατω
Zin1=zin(l(1),ZL,b,Zo);
Zin2=zin(l(2),Zin1-(1j./(2*pi.*f*C)),b,Zo);
Zin3=zin(l(3),bignum,b,Zo);
Zin=(Zin2.*Zin3)./(Zin2+Zin3);

%οριζω συντελεστη ανακλασης Γ=G και κανω τα αντιστοιχα simulations
G=abs((Zin-Zo)./(Zin+Zo));
figure (1);

plot(f,G);
grid on;
title('Διάγραμμα συντελεστή ανάκλασης ');
xlabel('f(Hz)');
ylabel('Γ');
ylim([0.26 1]);



figure(2);
plot(f,20*log10(G));
grid on;
title('Διάγραμμα συντελεστή ανάκλασης σε dB');
title('2-D Line Plot');
xlabel('f(Hz)');
ylabel('Γ(dB)');
ylim([-70 0]);

%συναρτηση υπολογισμου Zin για διαφορετικα μηκη γραμμης και ΖL φορτιου
function Zin=zin(li,Zli,b,Zo)
Zin = Zo*(Zli+1j*Zo*tan(b*li))./(Zo+1j*Zli.*tan(b*li));
end


